// File name:   program_counter_if.vh
// Updated:     8 September 2016
// Author:      Brian Rieder 
// Description: Interface file for Program Counter

`ifndef PROGRAM_COUNTER_IF_VH
`define PROGRAM_COUNTER_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface program_counter_if;
  // import types
  import cpu_types_pkg::*;

  word_t pc_next, pc_out;
  logic  pcWEN;

  // program counter ports
  modport pc (
    input  pc_next, pcWEN,
    output pc_out
  );
  // program counter tb
  modport tb (
    input  pc_out,
    output pc_next, pcWEN
  );
endinterface

`endif //PROGRAM_COUNTER_IF_VH
  