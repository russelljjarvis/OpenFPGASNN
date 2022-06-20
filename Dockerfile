FROM verilator/verilator-buildenv
MAINTAINER r.jarvis@westernsydney.edu
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
      apt-get -y install sudo

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


USER docker
RUN sudo apt update
RUN sudo apt install -y build-essential clang bison flex libreadline-dev \
                    gawk tcl-dev libffi-dev git mercurial graphviz   \
                    xdot pkg-config python python3 libftdi-dev

RUN sudo chown -R docker ~
RUN git clone https://github.com/cliffordwolf/icestorm.git
RUN git clone https://github.com/cseed/arachne-pnr.git
RUN git clone https://github.com/cliffordwolf/yosys.git


WORKDIR icestorm
RUN make -j4
RUN sudo make install

WORKDIR ../arachne-pnr
RUN make -j4
RUN sudo make install


WORKDIR ../yosys
RUN make -j4
RUN sudo make install

WORKDIR ../
RUN sudo apt install -y verilator gtkwave

WORKDIR src
RUN sudo make
RUN sudo make burn

WORKDIR IceStick-Examples/blinky
RUN make Vtop
RUN obj_dir/Vtop -t
# RUN gtkwave wave.vcd
