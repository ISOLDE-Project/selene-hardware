-- Component: AHB Filter
-- Author: Ilya Tuzov, Universitat Politecnica de Valencia
-- Description:
-- Checks AHB transactions against allowed address ranges (filtering rules) for each supervised AHB master 
-- Filtering rules for each master_id are stored in the filterting table as described below
-- A table storing filtering rules allocates 128 registers (16 masteres x 8 rules):
-- Each rule comprises 64 bits formatted as follows:
--   [63:40]     : Adr-High (24 bits) 
--   [39:16]     : Adr-Low (24 bits) 
--   [15: 5]     : flags: reserved bits
--       [4]     : flags: rule enabled (1) / disabled (0)
--     [3:0]     : hmaster-ID (4 bits: )      
--
--     +0   |   Master[0]  : Rule[0]  
--     +8   |   Master[0]  : Rule[1]  
--  .......................
--    +64   |   Master[1]  : Rule[0]
--    +72   |   Master[1]  : Rule[1]
--  .......................
--  +1016   |   Master[16] : Rule[7]

    

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
library grlib;
use grlib.config_types.all;
use grlib.config.all;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library gaisler;
use gaisler.uart.all;
--pragma translate_off
use std.textio.all;
--pragma translate_on

entity WG_AHB_FILTER is
  generic (
    pindex   : integer := 0;
    paddr    : integer := 0;
    pmask    : integer := 16#fff#;
    pirq     : integer := 0;
    abits    : integer := 10;
    nahbm    : integer range 1 to NAHBMST := NAHBMST);
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    msto    : in  ahb_mst_out_vector;
    mst_valid   : out std_logic_vector(NAHBMST-1 downto 0));
end;

architecture rtl of WG_AHB_FILTER is

constant REVISION : integer := 1;
constant NRULES : integer := 8;
constant NREG : integer := nahbm*NRULES;

-- TODO: reserve dedicated plug&play IDs for this IP
constant pconfig : apb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_APBUART, 0, REVISION, pirq),
  1 => apb_iobar(paddr, pmask));
  
  
  type regfile_t is array (0 to NREG-1) of std_logic_vector(63 downto 0);
  signal regfile, regfile_in : regfile_t;
  
  type init_flags_t is array (0 to NREG-1) of std_logic_vector(1 downto 0);
  signal initialized, initialized_in : init_flags_t;
  type master_check_t is array (0 to nahbm-1) of std_logic;
  signal master_check : master_check_t;
  signal int_request : std_logic;
  
begin
  -- Combinational logic to validate the requested address 
  -- against filtering rules in the regfile
  wg_checker : process(msto, regfile, master_check)
    type adr_array is array(0 to nahbm-1) of std_logic_vector(23 downto 0);
      variable adr_low, adr_high, adr_req : adr_array;
    type rules_list_check_t is array(0 to nahbm-1) of std_logic_vector(NRULES-1 downto 0);
    variable rules_check_vect : rules_list_check_t;
    variable mst_valid_v, mst_int_v : std_logic_vector(NAHBMST-1 downto 0);
    begin
        for i in 0 to NAHBMST-1 loop
          if( (i < nahbm) and (master_check(i) = '1')) then
            for k in 0 to NRULES-1 loop
                adr_req(i) := msto(i).haddr(31 downto 8);
                adr_low(i) := regfile(i*NRULES+k)(39 downto 16);
                adr_high(i) := regfile(i*NRULES+k)(63 downto 40);
                if (   ( unsigned(adr_req(i)) >= unsigned(adr_low(i)) )
                    and ( unsigned(adr_req(i)) <= unsigned(adr_high(i)) )) then
                    rules_check_vect(i)(k) := '1';
                else
                    rules_check_vect(i)(k) := '0';
                end if;
            end loop;
            mst_valid_v(i) := or_reduce(rules_check_vect(i));    
            mst_int_v(i) := (not mst_valid_v(i)) and msto(i).hbusreq;    
          else
            mst_valid_v(i) := '1';
            mst_int_v(i) := '0';
          end if;
        end loop;
        mst_valid <= mst_valid_v;
        int_request <= or_reduce(mst_int_v);
    end process;
  

  
  init : process(regfile, initialized)
    variable c : master_check_t;
    begin
    for i in 0 to nahbm-1 loop
        c(i) := '0';
        for k in 0 to NRULES-1 loop
            if (initialized(i*NRULES+k) = "11") then
                c(i) := c(i) or regfile(i*NRULES+k)(4);
            end if;
        end loop;
    end loop;
    master_check <= c;
  end process;
  
  -- REGFILE LOGIC
    apbio : process(rst, regfile, apbi, int_request)
        variable rdata : std_logic_vector(31 downto 0);
        variable irq : std_logic_vector(NAHBIRQ-1 downto 0);
        variable v : regfile_t;
        variable f : init_flags_t;
        variable half : std_ulogic;
        variable reg_id : std_logic_vector(6 downto 0);
    begin
        v := regfile;
        f := initialized;
        rdata := (others => '0');
        irq := (others => '0');
        irq(pirq) := int_request;
        reg_id := apbi.paddr(abits-1 downto 3); 
        half := apbi.paddr(2);
    
        if (apbi.psel(pindex) and apbi.penable) = '1' then
            if apbi.pwrite = '1' then
                if half = '0' then
                    v(to_integer(unsigned(reg_id)))(31 downto 0)  := apbi.pwdata; 
                    f(to_integer(unsigned(reg_id)))(0) := '1';
                else
                    v(to_integer(unsigned(reg_id)))(63 downto 32) := apbi.pwdata;    
                    f(to_integer(unsigned(reg_id)))(1) := '1';
                end if;
            else
                if half = '0' then
                    rdata := regfile(to_integer(unsigned(reg_id)))(31 downto 0); 
                else
                    rdata := regfile(to_integer(unsigned(reg_id)))(63 downto 32);    
                end if;                
            end if;
        end if;                
        
        regfile_in <= v;
        initialized_in <= f;        
        apbo.prdata <= rdata; apbo.pirq <= irq;
        apbo.pindex <= pindex;    
    end process;

    apbo.pconfig <= pconfig;
    

    
    regs : process(clk)
    begin
     if rising_edge(clk) then
      if rst = '0' then
        regfile <= (others => (others => '0'));
        initialized <= (others => (others => '0'));
      else
        regfile <= regfile_in;    
        initialized <= initialized_in;
      end if;
     end if;
    end process;
    
    
end;
  
