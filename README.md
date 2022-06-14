# Open Spike FPGA

A Fully open Source Simple spiking neural network implementation on FPGA.

# Getting started

Installation instructions are platform dependent for Linux or WSL run:
https://github.com/russelljjarvis/summon-fpga-tools

```bash
sudo apt-get install git mercurial build-essential bison clang cmake \
                     flex gawk graphviz xdot libboost-all-dev \
                     libeigen3-dev libffi-dev libftdi-dev libgmp3-dev \
                     libmpfr-dev libncurses5-dev libmpc-dev \
                     libreadline-dev zlib1g-dev pkg-config python \
                     python3 python3-dev tcl-dev autoconf gperf \
                     qtbase5-dev libqt5opengl5-dev gnat llvm

git clone https://github.com/esden/summon-fpga-tools.git or
wget https://github.com/esden/summon-fpga-tools/zipball/master; unzip master
cd summon-fpga-tools
./summon-fpga-tools.sh
export PATH=~/sft/bin:$PATH
```

# Run the simple example
```bash
yosys -p "synth_ice40 -blif out.blif" testbench.sv

arachne-pnr -d 5k out.blif -o out.asc

iceprog out.bin
```
