FROM ubuntu:20.04
RUN sudo apt install build-essential clang bison flex libreadline-dev \
                    gawk tcl-dev libffi-dev git mercurial graphviz   \
                    xdot pkg-config python python3 libftdi-dev

RUN git clone https://github.com/cliffordwolf/icestorm.git
RUN git clone https://github.com/cseed/arachne-pnr.git
RUN git clone https://github.com/cliffordwolf/yosys.git

PROCS=3

WORKDIR icestorm
RUN make -j$PROCS
RUN sudo make install
RUN cd ..

WORKDIR ../arachne-pnr
RUN make -j$PROCS
RUN sudo make install


WORKDIR ../yosys
make -j$PROCS
sudo make install
cd ..
WORKDIR ../
RUN sudo apt install verilator gtkwave

RUN git clone https://github.com/johnwinans/IceStick-Examples.git
WORKDIR IceStick-Examples/blinky
RUN make
RUN make burn

WORKDIR IceStick-Examples/blinky
RUN make Vtop
RUN obj_dir/Vtop -t
#RUN gtkwave wave.vcd
