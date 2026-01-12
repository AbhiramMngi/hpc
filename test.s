	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_test                           ; -- Begin function test
	.p2align	2
_test:                                  ; @test
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x8, x0, #32
	add	x9, x1, #32
	mov	w10, #65536                     ; =0x10000
LBB0_1:                                 ; %vector.body
                                        ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x9, #-32]
	ldp	q2, q3, [x9], #64
	ldp	q4, q5, [x8, #-32]
	ldp	q6, q7, [x8]
	add.16b	v0, v4, v0
	add.16b	v1, v5, v1
	add.16b	v2, v6, v2
	add.16b	v3, v7, v3
	stp	q0, q1, [x8, #-32]
	stp	q2, q3, [x8], #64
	subs	x10, x10, #64
	b.ne	LBB0_1
; %bb.2:                                ; %for.end
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function main
lCPI1_0:
	.byte	0                               ; 0x0
	.byte	1                               ; 0x1
	.byte	2                               ; 0x2
	.byte	3                               ; 0x3
	.byte	4                               ; 0x4
	.byte	5                               ; 0x5
	.byte	6                               ; 0x6
	.byte	7                               ; 0x7
	.byte	8                               ; 0x8
	.byte	9                               ; 0x9
	.byte	10                              ; 0xa
	.byte	11                              ; 0xb
	.byte	12                              ; 0xc
	.byte	13                              ; 0xd
	.byte	14                              ; 0xe
	.byte	15                              ; 0xf
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	x9, sp, #32, lsl #12            ; =131072
	sub	x9, x9, #32
	and	sp, x9, #0xffffffffffffffe0
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	mov	x8, #0                          ; =0x0
Lloh0:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x9, [x9]
	add	x10, sp, #24, lsl #12           ; =98304
	add	x10, x10, #32
	str	x9, [x10, #32760]
Lloh3:
	adrp	x9, lCPI1_0@PAGE
Lloh4:
	ldr	q0, [x9, lCPI1_0@PAGEOFF]
	movi.16b	v1, #16
	add	x9, sp, #16, lsl #12            ; =65536
	movi.16b	v2, #240
	mov	x10, sp
	movi.16b	v3, #32
LBB1_1:                                 ; %vector.body
                                        ; =>This Inner Loop Header: Depth=1
	add.16b	v4, v0, v1
	add	x11, x9, x8
	stp	q0, q4, [x11]
	neg.16b	v4, v0
	sub.16b	v5, v2, v0
	add	x11, x10, x8
	stp	q4, q5, [x11]
	add	x8, x8, #32
	add.16b	v0, v0, v3
	cmp	x8, #16, lsl #12                ; =65536
	b.ne	LBB1_1
; %bb.2:                                ; %for.cond.cleanup
	mov	x8, #0                          ; =0x0
	mov	x9, sp
	add	x10, sp, #16, lsl #12           ; =65536
LBB1_3:                                 ; %vector.body18
                                        ; =>This Inner Loop Header: Depth=1
	add	x11, x9, x8
	ldp	q0, q1, [x11]
	ldp	q2, q3, [x11, #32]
	add	x11, x10, x8
	ldp	q4, q5, [x11]
	ldp	q6, q7, [x11, #32]
	add.16b	v0, v4, v0
	add.16b	v1, v5, v1
	add.16b	v2, v6, v2
	add.16b	v3, v7, v3
	stp	q0, q1, [x11]
	stp	q2, q3, [x11, #32]
	add	x8, x8, #64
	cmp	x8, #16, lsl #12                ; =65536
	b.ne	LBB1_3
; %bb.4:                                ; %test.exit
	add	x8, sp, #24, lsl #12            ; =98304
	add	x8, x8, #32
	ldr	x8, [x8, #32760]
Lloh5:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh6:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh7:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB1_6
; %bb.5:                                ; %test.exit
	mov	w0, #0                          ; =0x0
	sub	sp, x29, #16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB1_6:                                 ; %test.exit
	bl	___stack_chk_fail
	.loh AdrpLdr	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh5, Lloh6, Lloh7
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
