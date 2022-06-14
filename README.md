# Open Spike FPGA

A Fully open Source Simple spiking neural network implementation on FPGA.

# Getting started

# Run the simple example
```bash
yosys -p "synth_ice40 -blif out.blif" testbench.sv
```

```bash
arachne-pnr -d 5k out.blif -o out.asc
```

```bash
iceprog out.bin
```
