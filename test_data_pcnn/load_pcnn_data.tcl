puts "Load input_img.bin la 0x90000000..."
mwr -bin -file "/home/uic18097/isolde/fotonation/pcnn4/test_cases/2026_08_07_224x224_ResNet18_FR_gray_normalized/FPGA_random_IO/input.bin" 0x90000000 12544
after 500

puts "Load params.bin at 0x9D000000..."
mwr -bin -file "/home/uic18097/isolde/fotonation/pcnn4/test_cases/2026_08_07_224x224_ResNet18_FR_gray_normalized/FPGA_random_IO/params.bin" 0x9D000000 5630184
after 1000 ;

puts "Load instructions.bin at 0x9F000000..."
mwr -bin -file "/home/uic18097/isolde/fotonation/pcnn4/test_cases/2026_08_07_224x224_ResNet18_FR_gray_normalized/FPGA_random_IO/instructions.bin" 0x9F000000 14276
after 500 ;

puts "Load expected_out.bin at 0x9FF00000..."
mwr -bin -file "/home/uic18097/isolde/fotonation/pcnn4/test_cases/2026_08_07_224x224_ResNet18_FR_gray_normalized/FPGA_random_IO/expected_out.bin" 0x9FF00000 64
after 500 ;

puts "--- Data loaded successful! ---"

