#!/bin/bash
# /*
# * Copyright (c) 2015 Regents of the University of Michigan
#  * All rights reserved.
#  *
#  * Redistribution and use in source and binary forms, with or without
#  * modification, are permitted provided that the following conditions are
#  * met: redistributions of source code must retain the above copyright
#  * notice, this list of conditions and the following disclaimer;
#  * redistributions in binary form must reproduce the above copyright
#  * notice, this list of conditions and the following disclaimer in the
#  * documentation and/or other materials provided with the distribution;
#  * neither the name of the copyright holders nor the names of its
#  * contributors may be used to endorse or promote products derived from
#  * this software without specific prior written permission.
#  *
#  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS                                                                                                                                               
#  * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#  * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#  * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
#  * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#  * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#  * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#  *
#  * Authors: Andrew Lukefahr
#  */

GCC=$(which gcc)
OBJDUMP=$(which gobjdump)

# create assembly files
# -S = create assembly
# -g = preserve debug symbols (origional C code)
# -O0 = (O)ptimization level 0 (Zero)
# -fvisibility=hidden only put necessary symbols in the symbol table 
$GCC -S -g -O0 main.c
$GCC -S -g -O0 foo.c

# create object files
# -c = create object file
# -g = preserve debug symbols
$GCC -c -g main.s
$GCC -c -g foo.s

# create executable file
# -o = output program name
$GCC main.o foo.o -o program

# relocation records
# -r = relocation table
$OBJDUMP -r foo.o > foo.relocation
$OBJDUMP -r main.o > main.relocation 

# symbol tables
# -t = symbol table
$OBJDUMP -t foo.o > foo.symbol
$OBJDUMP -t main.o > main.symbol

# executable code
# -S = output assembly mixed with source (C) code
$OBJDUMP -S foo.o > foo.disassembly
$OBJDUMP -S main.o > main.disassembly
$OBJDUMP -S program > program.disassembly

# data segments
# -s = output full contents in hex form
#useful to see .data and .rodata
$OBJDUMP -s main.o > main.hex
$OBJDUMP -s foo.o > foo.hex







