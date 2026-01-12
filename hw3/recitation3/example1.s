	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_test                           ; -- Begin function test
	.p2align	2
_test:                                  ; @test
Lfunc_begin0:
	.file	0 "/Users/abhiramngi/Desktop/hpc/hw3/recitation3" "example1.c" md5 0x0585044a2df4eba681dcc161f25d791c
	.cfi_startproc
; %bb.0:                                ; %entry
	;DEBUG_VALUE: test:a <- $x0
	;DEBUG_VALUE: test:b <- $x1
	;DEBUG_VALUE: test:i <- 0
	.loc	0 12 3 prologue_end             ; example1.c:12:3
	add	x8, x0, #16, lsl #12            ; =65536
	add	x9, x1, #16, lsl #12            ; =65536
	cmp	x9, x0
	ccmp	x8, x1, #0, hi
	b.hi	LBB0_3
Ltmp0:
; %bb.1:                                ; %vector.body.preheader
	;DEBUG_VALUE: test:i <- 0
	;DEBUG_VALUE: test:b <- $x1
	;DEBUG_VALUE: test:a <- $x0
	add	x8, x0, #32
	add	x9, x1, #32
	mov	w10, #65536                     ; =0x10000
Ltmp1:
LBB0_2:                                 ; %vector.body
                                        ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: test:i <- 0
	;DEBUG_VALUE: test:b <- $x1
	;DEBUG_VALUE: test:a <- $x0
	.loc	0 13 13                         ; example1.c:13:13
	ldp	q0, q1, [x9, #-32]
	ldp	q2, q3, [x9], #64
	.loc	0 13 10 is_stmt 0               ; example1.c:13:10
	ldp	q4, q5, [x8, #-32]
	ldp	q6, q7, [x8]
	add.16b	v0, v4, v0
	add.16b	v1, v5, v1
	add.16b	v2, v6, v2
	add.16b	v3, v7, v3
	stp	q0, q1, [x8, #-32]
	stp	q2, q3, [x8], #64
Ltmp2:
	.loc	0 12 26 is_stmt 1               ; example1.c:12:26
	subs	x10, x10, #64
	b.ne	LBB0_2
	b	LBB0_5
Ltmp3:
LBB0_3:                                 ; %for.body.preheader
	;DEBUG_VALUE: test:i <- 0
	;DEBUG_VALUE: test:b <- $x1
	;DEBUG_VALUE: test:a <- $x0
	.loc	0 0 26 is_stmt 0                ; example1.c:0:26
	mov	x8, #0                          ; =0x0
Ltmp4:
LBB0_4:                                 ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: test:b <- $x1
	;DEBUG_VALUE: test:a <- $x0
	;DEBUG_VALUE: test:i <- $x8
	.loc	0 13 13 is_stmt 1               ; example1.c:13:13
	ldrb	w9, [x1, x8]
	.loc	0 13 10 is_stmt 0               ; example1.c:13:10
	ldrb	w10, [x0, x8]
	add	w9, w10, w9
	strb	w9, [x0, x8]
Ltmp5:
	.loc	0 12 26 is_stmt 1               ; example1.c:12:26
	add	x8, x8, #1
Ltmp6:
	;DEBUG_VALUE: test:i <- $x8
	.loc	0 12 3 is_stmt 0                ; example1.c:12:3
	cmp	x8, #16, lsl #12                ; =65536
	b.ne	LBB0_4
Ltmp7:
LBB0_5:                                 ; %for.end
	;DEBUG_VALUE: test:b <- $x1
	;DEBUG_VALUE: test:a <- $x0
	.loc	0 15 1 is_stmt 1                ; example1.c:15:1
	ret
Ltmp8:
Lfunc_end0:
	.cfi_endproc
                                        ; -- End function
	.file	1 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/_types" "_uint8_t.h" md5 0x8b64ccf8c67b8c006b07b8daf1b49be5
	.file	2 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/_types" "_uint64_t.h" md5 0x77fc5e91653260959605f129691cf9b1
	.section	__DWARF,__debug_loclists,regular,debug
Lsection_debug_loc0:
.set Lset0, Ldebug_list_header_end0-Ldebug_list_header_start0 ; Length
	.long	Lset0
Ldebug_list_header_start0:
	.short	5                               ; Version
	.byte	8                               ; Address size
	.byte	0                               ; Segment selector size
	.long	1                               ; Offset entry count
Lloclists_table_base0:
.set Lset1, Ldebug_loc0-Lloclists_table_base0
	.long	Lset1
Ldebug_loc0:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Lfunc_begin0-Lfunc_begin0      ;   starting offset
	.uleb128 Ltmp4-Lfunc_begin0             ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp4-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp7-Lfunc_begin0             ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_list_header_end0:
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                               ; Abbreviation Code
	.byte	17                              ; DW_TAG_compile_unit
	.byte	1                               ; DW_CHILDREN_yes
	.byte	37                              ; DW_AT_producer
	.byte	37                              ; DW_FORM_strx1
	.byte	19                              ; DW_AT_language
	.byte	5                               ; DW_FORM_data2
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.ascii	"\202|"                         ; DW_AT_LLVM_sysroot
	.byte	37                              ; DW_FORM_strx1
	.ascii	"\357\177"                      ; DW_AT_APPLE_sdk
	.byte	37                              ; DW_FORM_strx1
	.byte	114                             ; DW_AT_str_offsets_base
	.byte	23                              ; DW_FORM_sec_offset
	.byte	16                              ; DW_AT_stmt_list
	.byte	23                              ; DW_FORM_sec_offset
	.byte	27                              ; DW_AT_comp_dir
	.byte	37                              ; DW_FORM_strx1
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	115                             ; DW_AT_addr_base
	.byte	23                              ; DW_FORM_sec_offset
	.ascii	"\214\001"                      ; DW_AT_loclists_base
	.byte	23                              ; DW_FORM_sec_offset
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	2                               ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.ascii	"\347\177"                      ; DW_AT_APPLE_omit_frame_ptr
	.byte	25                              ; DW_FORM_flag_present
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	3                               ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	4                               ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	34                              ; DW_FORM_loclistx
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	5                               ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
	.byte	22                              ; DW_TAG_typedef
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	7                               ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	0                               ; EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset2, Ldebug_info_end0-Ldebug_info_start0 ; Length of Unit
	.long	Lset2
Ldebug_info_start0:
	.short	5                               ; DWARF version number
	.byte	1                               ; DWARF Unit Type
	.byte	8                               ; Address Size (in bytes)
.set Lset3, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset3
	.byte	1                               ; Abbrev [1] 0xc:0x64 DW_TAG_compile_unit
	.byte	0                               ; DW_AT_producer
	.short	12                              ; DW_AT_language
	.byte	1                               ; DW_AT_name
	.byte	2                               ; DW_AT_LLVM_sysroot
	.byte	3                               ; DW_AT_APPLE_sdk
.set Lset4, Lstr_offsets_base0-Lsection_str_off ; DW_AT_str_offsets_base
	.long	Lset4
.set Lset5, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset5
	.byte	4                               ; DW_AT_comp_dir
                                        ; DW_AT_APPLE_optimized
	.byte	0                               ; DW_AT_low_pc
.set Lset6, Lfunc_end0-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset6
.set Lset7, Laddr_table_base0-Lsection_info0 ; DW_AT_addr_base
	.long	Lset7
.set Lset8, Lloclists_table_base0-Lsection_debug_loc0 ; DW_AT_loclists_base
	.long	Lset8
	.byte	2                               ; Abbrev [2] 0x29:0x29 DW_TAG_subprogram
	.byte	0                               ; DW_AT_low_pc
.set Lset9, Lfunc_end0-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset9
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
                                        ; DW_AT_call_all_calls
	.byte	5                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	9                               ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	3                               ; Abbrev [3] 0x34:0xa DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	6                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	9                               ; DW_AT_decl_line
	.long	82                              ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x3e:0xa DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	9                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	9                               ; DW_AT_decl_line
	.long	82                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x48:0x9 DW_TAG_variable
	.byte	0                               ; DW_AT_location
	.byte	10                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
	.long	99                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x52:0x5 DW_TAG_pointer_type
	.long	87                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x57:0x8 DW_TAG_typedef
	.long	95                              ; DW_AT_type
	.byte	8                               ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	7                               ; Abbrev [7] 0x5f:0x4 DW_TAG_base_type
	.byte	7                               ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	6                               ; Abbrev [6] 0x63:0x8 DW_TAG_typedef
	.long	107                             ; DW_AT_type
	.byte	12                              ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	7                               ; Abbrev [7] 0x6b:0x4 DW_TAG_base_type
	.byte	11                              ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str_offs,regular,debug
Lsection_str_off:
	.long	56                              ; Length of String Offsets Set
	.short	5
	.short	0
Lstr_offsets_base0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"clang version 19.1.7 (https://github.com/OpenCilk/opencilk-project cd8ccfc1fd8293654dde7bf26657f08f89c7e54b)" ; string offset=0
	.asciz	"example1.c"                    ; string offset=109
	.asciz	"/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk" ; string offset=120
	.asciz	"MacOSX.sdk"                    ; string offset=172
	.asciz	"/Users/abhiramngi/Desktop/hpc/hw3/recitation3" ; string offset=183
	.asciz	"test"                          ; string offset=229
	.asciz	"a"                             ; string offset=234
	.asciz	"uint8_t"                       ; string offset=236
	.asciz	"unsigned char"                 ; string offset=244
	.asciz	"b"                             ; string offset=258
	.asciz	"i"                             ; string offset=260
	.asciz	"uint64_t"                      ; string offset=262
	.asciz	"unsigned long long"            ; string offset=271
	.section	__DWARF,__debug_str_offs,regular,debug
	.long	0
	.long	109
	.long	120
	.long	172
	.long	183
	.long	229
	.long	234
	.long	244
	.long	236
	.long	258
	.long	260
	.long	271
	.long	262
	.section	__DWARF,__debug_addr,regular,debug
Lsection_info0:
.set Lset10, Ldebug_addr_end0-Ldebug_addr_start0 ; Length of contribution
	.long	Lset10
Ldebug_addr_start0:
	.short	5                               ; DWARF version number
	.byte	8                               ; Address size
	.byte	0                               ; Segment selector size
Laddr_table_base0:
	.quad	Lfunc_begin0
Ldebug_addr_end0:
	.section	__DWARF,__debug_names,regular,debug
Ldebug_names_begin:
.set Lset11, Lnames_end0-Lnames_start0  ; Header: unit length
	.long	Lset11
Lnames_start0:
	.short	5                               ; Header: version
	.short	0                               ; Header: padding
	.long	1                               ; Header: compilation unit count
	.long	0                               ; Header: local type unit count
	.long	0                               ; Header: foreign type unit count
	.long	5                               ; Header: bucket count
	.long	5                               ; Header: name count
.set Lset12, Lnames_abbrev_end0-Lnames_abbrev_start0 ; Header: abbreviation table size
	.long	Lset12
	.long	8                               ; Header: augmentation string size
	.ascii	"LLVM0700"                      ; Header: augmentation string
.set Lset13, Lcu_begin0-Lsection_info   ; Compilation unit 0
	.long	Lset13
	.long	1                               ; Bucket 0
	.long	2                               ; Bucket 1
	.long	3                               ; Bucket 2
	.long	0                               ; Bucket 3
	.long	4                               ; Bucket 4
	.long	857652610                       ; Hash in Bucket 0
	.long	789719536                       ; Hash in Bucket 1
	.long	2090756197                      ; Hash in Bucket 2
	.long	290821634                       ; Hash in Bucket 4
	.long	-104093792                      ; Hash in Bucket 4
	.long	271                             ; String in Bucket 0: unsigned long long
	.long	236                             ; String in Bucket 1: uint8_t
	.long	229                             ; String in Bucket 2: test
	.long	262                             ; String in Bucket 4: uint64_t
	.long	244                             ; String in Bucket 4: unsigned char
.set Lset14, Lnames4-Lnames_entries0    ; Offset in Bucket 0
	.long	Lset14
.set Lset15, Lnames1-Lnames_entries0    ; Offset in Bucket 1
	.long	Lset15
.set Lset16, Lnames0-Lnames_entries0    ; Offset in Bucket 2
	.long	Lset16
.set Lset17, Lnames3-Lnames_entries0    ; Offset in Bucket 4
	.long	Lset17
.set Lset18, Lnames2-Lnames_entries0    ; Offset in Bucket 4
	.long	Lset18
Lnames_abbrev_start0:
	.byte	1                               ; Abbrev code
	.byte	36                              ; DW_TAG_base_type
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	2                               ; Abbrev code
	.byte	22                              ; DW_TAG_typedef
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	3                               ; Abbrev code
	.byte	46                              ; DW_TAG_subprogram
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev list
Lnames_abbrev_end0:
Lnames_entries0:
Lnames4:
L2:
	.byte	1                               ; Abbreviation code
	.long	107                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned long long
Lnames1:
L3:
	.byte	2                               ; Abbreviation code
	.long	87                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint8_t
Lnames0:
L1:
	.byte	3                               ; Abbreviation code
	.long	41                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: test
Lnames3:
L0:
	.byte	2                               ; Abbreviation code
	.long	99                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint64_t
Lnames2:
L4:
	.byte	1                               ; Abbreviation code
	.long	95                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned char
	.p2align	2, 0x0
Lnames_end0:
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
