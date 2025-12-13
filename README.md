## ECE 128 Final Project README File


## Project Description
This is the final project of ECE 128, where my partner and I designed a calculator on the FPGA Board. This calculator takes in two 4-bit user inputs that can be processed through a total of 8 different operations. 4 arithmetic operations of add, subtract, multiply, and divide, and 4 logical operations of AND, OR, XOR, and NOT. The result of these operations must be outputted on the FPGA board using its seven-segment display. Through the incorporation of previous labs in this course, as well as designing a calculator module and a top module to make a working system, the overall functionality is working as intended and can be tested using the provided code. Further details on testing, code, and design explanations, as well as a detailed discussion of this project, can be found in the final report. 

## How to simulate the program and implement it on the FPGA 
To simulate the program, ensure that each file is located in the design sources, the constraints files are in the constraints directory, and the testbench file is in the simulation sources directory. Make sure the top_module.v file is set as top in the design sources. To run the simulation, go to the navigator on the left side of Vivado and click run simulation, then run behavioral simulation to output the waveforms of the testbench. 

To program the FPGA with the top_module, make sure the proper module and constraint files are selected. Then run the synthesis, implementation, and generate the bitstream. Once the bitstream is generated, open the hardware manager to connect your FPGA board and program the board using the .bit file. 
