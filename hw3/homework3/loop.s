	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x28, x27, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	sub	sp, sp, #30, lsl #12            ; =122880
	sub	sp, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w27, -56
	.cfi_offset w28, -64
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-56]
	mov	w20, #34464                     ; =0x86a0
	movk	w20, #1, lsl #16
	str	wzr, [sp, #52]
	add	x19, sp, #20, lsl #12           ; =81920
	add	x19, x19, #56
	add	x0, sp, #20, lsl #12            ; =81920
	add	x0, x0, #56
	mov	w1, #40960                      ; =0xa000
	bl	_bzero
	add	x21, sp, #10, lsl #12           ; =40960
	add	x21, x21, #56
	add	x0, sp, #10, lsl #12            ; =40960
	add	x0, x0, #56
	mov	w1, #40960                      ; =0xa000
	bl	_bzero
	add	x22, sp, #56
	add	x0, sp, #56
	mov	w1, #40960                      ; =0xa000
	bl	_bzero
	bl	_mach_absolute_time
	mov	w8, #0                          ; =0x0
LBB0_1:                                 ; %vector.ph
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
	mov	x9, #0                          ; =0x0
LBB0_2:                                 ; %vector.body
                                        ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x10, x19, x9
	ldp	q0, q1, [x10]
	ldp	q2, q3, [x10, #32]
	add	x10, x21, x9
	ldp	q4, q5, [x10]
	ldp	q6, q7, [x10, #32]
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	add	x10, x22, x9
	stp	q0, q1, [x10]
	stp	q2, q3, [x10, #32]
	add	x9, x9, #64
	cmp	x9, #10, lsl #12                ; =40960
	b.ne	LBB0_2
; %bb.3:                                ; %for.inc20
                                        ;   in Loop: Header=BB0_1 Depth=1
	add	w8, w8, #1
	cmp	w8, w20
	b.ne	LBB0_1
; %bb.4:                                ; %for.end22
	bl	_mach_absolute_time
	add	x0, sp, #52
	bl	_rand_r
	mov	w8, #26215                      ; =0x6667
	movk	w8, #26214, lsl #16
	smull	x8, w0, w8
	lsr	x9, x8, #32
	lsr	x8, x8, #63
	add	w8, w8, w9, asr #12
	mov	w9, #10240                      ; =0x2800
	msub	w8, w8, w9, w0
	add	x10, sp, #56
	ldr	w19, [x10, w8, sxtw #2]
Lloh3:
	adrp	x8, l_.str.2@PAGE
Lloh4:
	add	x10, x8, l_.str.2@PAGEOFF
Lloh5:
	adrp	x8, l_.str.1@PAGE
Lloh6:
	add	x8, x8, l_.str.1@PAGEOFF
	stp	x8, x10, [sp, #24]
	stp	x9, x20, [sp, #8]
	mov	x8, #9221120237041090560        ; =0x7ff8000000000000
	str	x8, [sp]
Lloh7:
	adrp	x0, l_.str@PAGE
Lloh8:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-56]
Lloh9:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh10:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh11:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_6
; %bb.5:                                ; %for.end22
	mov	x0, x19
	add	sp, sp, #30, lsl #12            ; =122880
	add	sp, sp, #64
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #64             ; 16-byte Folded Reload
	ret
LBB0_6:                                 ; %for.end22
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh9, Lloh10, Lloh11
	.loh AdrpAdd	Lloh7, Lloh8
	.loh AdrpAdd	Lloh5, Lloh6
	.loh AdrpAdrp	Lloh3, Lloh5
	.loh AdrpAdd	Lloh3, Lloh4
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Elapsed execution time: %f sec; N: %d, I: %d, __OP__: %s, __TYPE__: %s\n"

l_.str.1:                               ; @.str.1
	.asciz	"+"

l_.str.2:                               ; @.str.2
	.asciz	"uint32_t"

.subsections_via_symbols
