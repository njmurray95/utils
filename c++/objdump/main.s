	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.file	1 "main.c"
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
Lfunc_begin0:
	.loc	1 48 0                  ## main.c:48:0
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	L_.str.1(%rip), %rax
	.loc	1 51 18 prologue_end    ## main.c:51:18
Ltmp3:
	movq	%rax, -8(%rbp)
	.loc	1 53 9                  ## main.c:53:9
	movl	$0, -12(%rbp)
	.loc	1 57 13                 ## main.c:57:13
	movl	-12(%rbp), %edi
	.loc	1 57 9 is_stmt 0        ## main.c:57:9
	callq	_foo
	.loc	1 57 7                  ## main.c:57:7
	movl	%eax, -12(%rbp)
	.loc	1 58 13 is_stmt 1       ## main.c:58:13
	movl	-12(%rbp), %edi
	.loc	1 58 9 is_stmt 0        ## main.c:58:9
	callq	_foo
	.loc	1 58 7                  ## main.c:58:7
	movl	%eax, -12(%rbp)
	.loc	1 61 9 is_stmt 1        ## main.c:61:9
	movl	-12(%rbp), %eax
	.loc	1 61 11 is_stmt 0       ## main.c:61:11
	addl	_GLOBAL_VAR(%rip), %eax
	.loc	1 61 7                  ## main.c:61:7
	movl	%eax, -12(%rbp)
	.loc	1 65 12 is_stmt 1       ## main.c:65:12
	movq	-8(%rbp), %rdi
	.loc	1 65 23 is_stmt 0       ## main.c:65:23
	movl	-12(%rbp), %esi
	.loc	1 65 5                  ## main.c:65:5
	movb	$0, %al
	callq	_printf
	xorl	%esi, %esi
                                        ## 
	.loc	1 69 12 is_stmt 1       ## main.c:69:12
	movq	_end_str(%rip), %rdi
	.loc	1 69 5 is_stmt 0        ## main.c:69:5
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	.loc	1 71 1 is_stmt 1        ## main.c:71:1
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
Ltmp4:
Lfunc_end0:
	.cfi_endproc

	.section	__DATA,__data
	.globl	_GLOBAL_VAR             ## @GLOBAL_VAR
	.align	2
_GLOBAL_VAR:
	.long	48879                   ## 0xbeef

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"the end\n"

	.section	__DATA,__data
	.globl	_end_str                ## @end_str
	.align	3
_end_str:
	.quad	L_.str

	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"the final sum is: %d\n"

	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple LLVM version 7.3.0 (clang-703.0.31)" ## string offset=0
	.asciz	"main.c"                ## string offset=42
	.asciz	"/Users/newton/text/prog/c++/objdump" ## string offset=49
	.asciz	"GLOBAL_VAR"            ## string offset=85
	.asciz	"int"                   ## string offset=96
	.asciz	"end_str"               ## string offset=100
	.asciz	"char"                  ## string offset=108
	.asciz	"main"                  ## string offset=113
	.asciz	"const_str"             ## string offset=118
	.asciz	"i"                     ## string offset=128
	.section	__DWARF,__debug_loc,regular,debug
Lsection_debug_loc:
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                       ## Abbreviation Code
	.byte	17                      ## DW_TAG_compile_unit
	.byte	1                       ## DW_CHILDREN_yes
	.byte	37                      ## DW_AT_producer
	.byte	14                      ## DW_FORM_strp
	.byte	19                      ## DW_AT_language
	.byte	5                       ## DW_FORM_data2
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	16                      ## DW_AT_stmt_list
	.byte	6                       ## DW_FORM_data4
	.byte	27                      ## DW_AT_comp_dir
	.byte	14                      ## DW_FORM_strp
	.byte	17                      ## DW_AT_low_pc
	.byte	1                       ## DW_FORM_addr
	.byte	18                      ## DW_AT_high_pc
	.byte	1                       ## DW_FORM_addr
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	2                       ## Abbreviation Code
	.byte	52                      ## DW_TAG_variable
	.byte	0                       ## DW_CHILDREN_no
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	63                      ## DW_AT_external
	.byte	12                      ## DW_FORM_flag
	.byte	58                      ## DW_AT_decl_file
	.byte	11                      ## DW_FORM_data1
	.byte	59                      ## DW_AT_decl_line
	.byte	11                      ## DW_FORM_data1
	.byte	2                       ## DW_AT_location
	.byte	10                      ## DW_FORM_block1
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	3                       ## Abbreviation Code
	.byte	36                      ## DW_TAG_base_type
	.byte	0                       ## DW_CHILDREN_no
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	62                      ## DW_AT_encoding
	.byte	11                      ## DW_FORM_data1
	.byte	11                      ## DW_AT_byte_size
	.byte	11                      ## DW_FORM_data1
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	4                       ## Abbreviation Code
	.byte	15                      ## DW_TAG_pointer_type
	.byte	0                       ## DW_CHILDREN_no
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	5                       ## Abbreviation Code
	.byte	15                      ## DW_TAG_pointer_type
	.byte	0                       ## DW_CHILDREN_no
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	6                       ## Abbreviation Code
	.byte	46                      ## DW_TAG_subprogram
	.byte	1                       ## DW_CHILDREN_yes
	.byte	17                      ## DW_AT_low_pc
	.byte	1                       ## DW_FORM_addr
	.byte	18                      ## DW_AT_high_pc
	.byte	1                       ## DW_FORM_addr
	.byte	64                      ## DW_AT_frame_base
	.byte	10                      ## DW_FORM_block1
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	58                      ## DW_AT_decl_file
	.byte	11                      ## DW_FORM_data1
	.byte	59                      ## DW_AT_decl_line
	.byte	11                      ## DW_FORM_data1
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	63                      ## DW_AT_external
	.byte	12                      ## DW_FORM_flag
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	7                       ## Abbreviation Code
	.byte	52                      ## DW_TAG_variable
	.byte	0                       ## DW_CHILDREN_no
	.byte	2                       ## DW_AT_location
	.byte	10                      ## DW_FORM_block1
	.byte	3                       ## DW_AT_name
	.byte	14                      ## DW_FORM_strp
	.byte	58                      ## DW_AT_decl_file
	.byte	11                      ## DW_FORM_data1
	.byte	59                      ## DW_AT_decl_line
	.byte	11                      ## DW_FORM_data1
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	8                       ## Abbreviation Code
	.byte	38                      ## DW_TAG_const_type
	.byte	0                       ## DW_CHILDREN_no
	.byte	73                      ## DW_AT_type
	.byte	19                      ## DW_FORM_ref4
	.byte	0                       ## EOM(1)
	.byte	0                       ## EOM(2)
	.byte	0                       ## EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
	.long	176                     ## Length of Unit
	.short	2                       ## DWARF version number
Lset0 = Lsection_abbrev-Lsection_abbrev ## Offset Into Abbrev. Section
	.long	Lset0
	.byte	8                       ## Address Size (in bytes)
	.byte	1                       ## Abbrev [1] 0xb:0xa9 DW_TAG_compile_unit
	.long	0                       ## DW_AT_producer
	.short	12                      ## DW_AT_language
	.long	42                      ## DW_AT_name
Lset1 = Lline_table_start0-Lsection_line ## DW_AT_stmt_list
	.long	Lset1
	.long	49                      ## DW_AT_comp_dir
	.quad	Lfunc_begin0            ## DW_AT_low_pc
	.quad	Lfunc_end0              ## DW_AT_high_pc
	.byte	2                       ## Abbrev [2] 0x2e:0x16 DW_TAG_variable
	.long	85                      ## DW_AT_name
	.long	68                      ## DW_AT_type
	.byte	1                       ## DW_AT_external
	.byte	1                       ## DW_AT_decl_file
	.byte	38                      ## DW_AT_decl_line
	.byte	9                       ## DW_AT_location
	.byte	3
	.quad	_GLOBAL_VAR
	.byte	3                       ## Abbrev [3] 0x44:0x7 DW_TAG_base_type
	.long	96                      ## DW_AT_name
	.byte	5                       ## DW_AT_encoding
	.byte	4                       ## DW_AT_byte_size
	.byte	2                       ## Abbrev [2] 0x4b:0x16 DW_TAG_variable
	.long	100                     ## DW_AT_name
	.long	97                      ## DW_AT_type
	.byte	1                       ## DW_AT_external
	.byte	1                       ## DW_AT_decl_file
	.byte	44                      ## DW_AT_decl_line
	.byte	9                       ## DW_AT_location
	.byte	3
	.quad	_end_str
	.byte	4                       ## Abbrev [4] 0x61:0x5 DW_TAG_pointer_type
	.long	102                     ## DW_AT_type
	.byte	3                       ## Abbrev [3] 0x66:0x7 DW_TAG_base_type
	.long	108                     ## DW_AT_name
	.byte	6                       ## DW_AT_encoding
	.byte	1                       ## DW_AT_byte_size
	.byte	5                       ## Abbrev [5] 0x6d:0x1 DW_TAG_pointer_type
	.byte	6                       ## Abbrev [6] 0x6e:0x3b DW_TAG_subprogram
	.quad	Lfunc_begin0            ## DW_AT_low_pc
	.quad	Lfunc_end0              ## DW_AT_high_pc
	.byte	1                       ## DW_AT_frame_base
	.byte	86
	.long	113                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	47                      ## DW_AT_decl_line
	.long	68                      ## DW_AT_type
	.byte	1                       ## DW_AT_external
	.byte	7                       ## Abbrev [7] 0x8c:0xe DW_TAG_variable
	.byte	2                       ## DW_AT_location
	.byte	145
	.byte	120
	.long	118                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	51                      ## DW_AT_decl_line
	.long	169                     ## DW_AT_type
	.byte	7                       ## Abbrev [7] 0x9a:0xe DW_TAG_variable
	.byte	2                       ## DW_AT_location
	.byte	145
	.byte	116
	.long	128                     ## DW_AT_name
	.byte	1                       ## DW_AT_decl_file
	.byte	53                      ## DW_AT_decl_line
	.long	68                      ## DW_AT_type
	.byte	0                       ## End Of Children Mark
	.byte	4                       ## Abbrev [4] 0xa9:0x5 DW_TAG_pointer_type
	.long	174                     ## DW_AT_type
	.byte	8                       ## Abbrev [8] 0xae:0x5 DW_TAG_const_type
	.long	102                     ## DW_AT_type
	.byte	0                       ## End Of Children Mark
	.section	__DWARF,__debug_ranges,regular,debug
Ldebug_range:
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712              ## Header Magic
	.short	1                       ## Header Version
	.short	0                       ## Header Hash Function
	.long	3                       ## Header Bucket Count
	.long	3                       ## Header Hash Count
	.long	12                      ## Header Data Length
	.long	0                       ## HeaderData Die Offset Base
	.long	1                       ## HeaderData Atom Count
	.short	1                       ## DW_ATOM_die_offset
	.short	6                       ## DW_FORM_data4
	.long	0                       ## Bucket 0
	.long	1                       ## Bucket 1
	.long	-1                      ## Bucket 2
	.long	1201024158              ## Hash in Bucket 0
	.long	1784196532              ## Hash in Bucket 1
	.long	2090499946              ## Hash in Bucket 1
	.long	LNames1-Lnames_begin    ## Offset in Bucket 0
	.long	LNames2-Lnames_begin    ## Offset in Bucket 1
	.long	LNames0-Lnames_begin    ## Offset in Bucket 1
LNames1:
	.long	85                      ## GLOBAL_VAR
	.long	1                       ## Num DIEs
	.long	46
	.long	0
LNames2:
	.long	100                     ## end_str
	.long	1                       ## Num DIEs
	.long	75
	.long	0
LNames0:
	.long	113                     ## main
	.long	1                       ## Num DIEs
	.long	110
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712              ## Header Magic
	.short	1                       ## Header Version
	.short	0                       ## Header Hash Function
	.long	1                       ## Header Bucket Count
	.long	0                       ## Header Hash Count
	.long	12                      ## Header Data Length
	.long	0                       ## HeaderData Die Offset Base
	.long	1                       ## HeaderData Atom Count
	.short	1                       ## DW_ATOM_die_offset
	.short	6                       ## DW_FORM_data4
	.long	-1                      ## Bucket 0
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712              ## Header Magic
	.short	1                       ## Header Version
	.short	0                       ## Header Hash Function
	.long	1                       ## Header Bucket Count
	.long	0                       ## Header Hash Count
	.long	12                      ## Header Data Length
	.long	0                       ## HeaderData Die Offset Base
	.long	1                       ## HeaderData Atom Count
	.short	1                       ## DW_ATOM_die_offset
	.short	6                       ## DW_FORM_data4
	.long	-1                      ## Bucket 0
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712              ## Header Magic
	.short	1                       ## Header Version
	.short	0                       ## Header Hash Function
	.long	2                       ## Header Bucket Count
	.long	2                       ## Header Hash Count
	.long	20                      ## Header Data Length
	.long	0                       ## HeaderData Die Offset Base
	.long	3                       ## HeaderData Atom Count
	.short	1                       ## DW_ATOM_die_offset
	.short	6                       ## DW_FORM_data4
	.short	3                       ## DW_ATOM_die_tag
	.short	5                       ## DW_FORM_data2
	.short	4                       ## DW_ATOM_type_flags
	.short	11                      ## DW_FORM_data1
	.long	0                       ## Bucket 0
	.long	1                       ## Bucket 1
	.long	193495088               ## Hash in Bucket 0
	.long	2090147939              ## Hash in Bucket 1
	.long	Ltypes0-Ltypes_begin    ## Offset in Bucket 0
	.long	Ltypes1-Ltypes_begin    ## Offset in Bucket 1
Ltypes0:
	.long	96                      ## int
	.long	1                       ## Num DIEs
	.long	68
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	108                     ## char
	.long	1                       ## Num DIEs
	.long	102
	.short	36
	.byte	0
	.long	0
	.section	__DWARF,__apple_exttypes,regular,debug
Lexttypes_begin:
	.long	1212240712              ## Header Magic
	.short	1                       ## Header Version
	.short	0                       ## Header Hash Function
	.long	1                       ## Header Bucket Count
	.long	0                       ## Header Hash Count
	.long	12                      ## Header Data Length
	.long	0                       ## HeaderData Die Offset Base
	.long	1                       ## HeaderData Atom Count
	.short	7                       ## DW_ATOM_ext_types
	.short	6                       ## DW_FORM_data4
	.long	-1                      ## Bucket 0

.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
