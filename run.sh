verilator -Wall --cc tvmix_calc.v --exe top.cpp
make -C obj_dir -f Vtvmix_calc.mk
obj_dir/Vtvmix_calc
