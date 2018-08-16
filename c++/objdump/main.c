/*
 * Copyright (c) 2015 Regents of the University of Michigan
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met: redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer;
 * redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution;
 * neither the name of the copyright holders nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS                                                                                                                                               
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Authors: Andrew Lukefahr
 */

#include <stdio.h>

/* external function prototype*/
extern int foo( int bar);

/*global variable  lives in .data (Read/Write Data) */
/*visiable globally, so it gets a symbol table entry */
int GLOBAL_VAR = 0xbeef;

/* "the end\n" lives in .rodata (read-only data */
/* char * end_str lives in .data (read/write data) */
/* end_str also gets a symbol table entry */
/* "the end\n" also gets a relocation table entry */
char * end_str = "the end\n";

/* main gets a symbol table entry */
int main()
{
    /* "the final sum is: %d\n" lives in .rodata (read only data) */
    /* const char * const_str lives on the stack */
    const char * const_str = "the final sum is: %d\n";

    int i = 0;
  
    /* external function, needs relocation table entry (2x) */
    /* undefined reference also needs a symbol table entry (1x) */
    i = foo(i);
    i = foo(i);

    /* reference to GLOBAL_VAR will need relocation entry */
    i = i + GLOBAL_VAR;

    /* external function, needs a symbol table entry */
    /* reference to printf will need relocation entry */
    printf(const_str, i);

    /* printf needs relocation entry */
    /* end_str needs relocation entry */
    printf(end_str,NULL);
    
}

