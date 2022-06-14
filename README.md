# Open Spike FPGA

A Fully open Source Simple spiking neural network implementation on FPGA.

# Getting started
sudo apt install verilator gtkwave

# Run the simple example
yosys -p "synth_ice40 -blif out.blif" testbench.sv
arachne-pnr -d 5k out.blif -o out.asc
iceprog out.bin
