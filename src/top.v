//**************************************************************************
//
//    Copyright (C) 2020  John Winans
//
//    This library is free software; you can redistribute it and/or
//    modify it under the terms of the GNU Lesser General Public
//    License as published by the Free Software Foundation; either
//    version 2.1 of the License, or (at your option) any later version.
//
//    This library is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//    Lesser General Public License for more details.
//
//    You should have received a copy of the GNU Lesser General Public
//    License along with this library; if not, write to the Free Software
//    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
//    USA
//
//**************************************************************************




/**
* This will turn on led1 when btn1 is pressed.
**************************************************************************/
/* verilator lint_off BLKSEQ *//* verilator lint_off BLKSEQ */
`timescale 1ns/1ns

module top (clk, neuron_in1, neuron_in2, neuron_in3,
                     w3i, w2i, w1i, neuron_out);

  // Neuron Inputs Declaration
  input wire [2:0] w1i;
  input wire [2:0] w2i;
  input wire [2:0] w3i;
  input wire clk;
  input wire neuron_in1;
  input wire neuron_in2;
  input wire neuron_in3;

  //Neuron Outputs Declaration
  output neuron_out;

  // Neuron Constants
  reg [4:0] V_rest = 6;
  reg [4/* verilator lint_off BLKSEQ */:0] V_leak = 1;
  reg K_syn = 1;
  reg [4:0] V_thresh = 14;
  reg [4:0] V_i = 6;
  reg neuron_i_reg = 0;

  // Neuron Dynamics
  always @(posedge clk) begin
    neuron_i_reg = 0;
    V_i = V_i + K_syn * (w1i*neuron_in1 + w2i*neuron_in2 + w3i*neuron_in3) - V_leak;
    if (V_i >= V_thresh) begin
      V_i = V_rest;
      neuron_i_reg = 1;
    end
    if (V_i < V_rest) begin
      V_i = V_rest;
    end
  end
  assign neuron_out = neuron_i_reg;
endmodule
