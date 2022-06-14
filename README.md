<center> <h1> Open Spiking FPGA Code </h1></center>
<center> <h3> A FOSS Spiking Neural Network Workflow and Implementation on FPGA </h3> </center>

<p align="center">
  <a href="#Rational">Rational</a> •
  <a href="#Getting Started">Getting-Started</a> •
  <a href="#Goals">Goals</a> •
  <a href="#Installation-Steps">Installation Steps</a> •
  <a href="#TODO">TODO</a> •

  
</p>


### Rational:
* HDL/FPGA hardware engineers should enjoy Continuous Integration and Agile workflows just like the mainstream software ecosystem.
* Document how to run a basic LIF network model on open FPGA tools using exclusively CLI/TCL as much as possible.
* Simulate small scale SNNs via a workflow that uses the least amount of graphical tools and human manual interventions as possible.




### Getting started
#### Installation Steps
<details>
<summary> Steps </summary>
  
### Step 1. * Build Prerequisites - what we need before we begin

```bash
sudo apt-get install git mercurial build-essential bison clang cmake \
                     flex gawk graphviz xdot libboost-all-dev \
                     libeigen3-dev libffi-dev libftdi-dev libgmp3-dev \
                     libmpfr-dev libncurses5-dev libmpc-dev \
                     libreadline-dev zlib1g-dev pkg-config python \
                     python3 python3-dev tcl-dev autoconf gperf \
                     qtbase5-dev libqt5opengl5-dev gnat llvm
```
### Step 2 Use Summon FPGA script to compile and make some stuff
  
Installation instructions are platform dependent for Linux or WSL run:
```
git clone https://github.com/russelljjarvis/summon-fpga-tools.git or
wget https://github.com/russelljjarvis/summon-fpga-tools/zipball/master; unzip master
cd summon-fpga-tools
./summon-fpga-tools.sh
export PATH=~/sft/bin:$PATH
```

  
### Step 3 
```
sudo apt install verilator gtkwave 
````
### Step 4 simulate: 

# Run the simple example
```bash
yosys -p "synth_ice40 -blif out.blif" testbench.sv

arachne-pnr -d 5k out.blif -o out.asc

iceprog out.bin
```
</details>


### The Hardware: 
Lattice Ice-40
#### Lattice Icebreaker 


### The FOSS Workflow Pieces  
  
* IceStorm Tools - create bitstreams file and programs boards
* nextpnr - portable place and route
* iVerilog - Verilog simulation and synthesis tool (optional)
* Yosys - Verilog RTL synthesis
* Verilator - Verilog simulation and linting (optional)

<!---
![image](https://user-images.githubusercontent.com/7786645/165408804-49b5d01f-2d8d-4ffa-9096-e1297668351c.png)
 

[Lattice Tools](https://projectf.io/posts/building-ice40-fpga-toolchain/
https://www.twam.info/software/using-the-icebreaker-with-an-open-source-fpga-toolchain-on-os-x0  

--->



### TODO:
- [x] LED Blink on Lattice
- [ ] CI verilator. Demonstrate that HDL engineers can automate and do code integration in the cloud just like the rest of the software world.
- [ ] verilator GTK wave verification of SNN signals
- [ ] Command line scripts lend themselves to automation, GUIs lend themselves to human intervention.
- [ ] Create an Open Source Alternative work flow for smaller neural network simulations
- [ ] Command line installation and execution of Lattice Ice Breaker for a relatively small network.

[Hardware](https://www.ebay.com.au/itm/294911341271?chn=ps&_ul=AU&_trkparms=ispr%3D1&amdata=enc%3A15VigHYHPTJy5LEioAsdn_w46&norover=1&mkevt=1&mkrid=705-139619-5960-0&mkcid=2&itemid=294911341271&targetid=1597039205993&device=c&mktype=pla&googleloc=9071706&poi=&campaignid=14475548396&mkgroupid=128101662393&rlsatarget=pla-1597039205993&abcId=9300653&merchantid=561570219&gclid=CjwKCAjwsJ6TBhAIEiwAfl4TWJV2lxIXDQSU_jsqCGkdIZW2a5OEJv8RRiyWQ4RGNXH4vBOw-hj-bBoCYd8QAvD_BwE)
