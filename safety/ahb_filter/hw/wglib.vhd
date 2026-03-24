library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.stdlib.all;
use grlib.amba.all;

package libwg is

component WG_AHB_FILTER is
  generic (
    pindex   : integer := 0;
    paddr    : integer := 0;
    pmask    : integer := 16#fff#;
    pirq     : integer := 0;
	abits    : integer := 8;
	nahbm    : integer range 1 to NAHBMST := NAHBMST);
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
	msto    : in  ahb_mst_out_vector;
	mst_valid   : out std_logic_vector(NAHBMST-1 downto 0));
end component;

end package;