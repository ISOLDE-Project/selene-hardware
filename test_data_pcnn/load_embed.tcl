puts "Loading the embeddigns..."

mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/ref_00_Jane_norm_fp32.bin" 	0x85000000 128							
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/ref_01_Andreea_norm_fp32.bin" 	0x85000200 128

mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/sami_9.bin" 0x85000400 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/sami_10.bin" 0x85000600 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/sami_14.bin" 0x85000800 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/dani_11.bin" 0x85000A00 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/dani_15.bin" 0x85000C00 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/dani_16.bin" 0x85000E00 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/danut_15.bin" 0x85001000 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/danut_16.bin" 0x85001200 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/danut_20.bin" 0x85001400 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/no_person_1.bin" 0x85001600 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/no_person_2.bin" 0x85001800 128
mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/no_person_3.bin" 0x85001A00 128

mwr -bin -file "/home/uic18097/isolde/git/selene/selene-hardware/test_data_pcnn/ref_05_Mihai_norm_fp32.bin" 	0x85001C00 128

puts "Embeddings was loaded."
