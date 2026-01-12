	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_sort_i                         ; -- Begin function sort_i
	.p2align	2
_sort_i:                                ; @sort_i
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	w1, [x29, #-12]
	str	w2, [sp, #16]
	ldur	x8, [x29, #-8]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:                                 ; %cond.true
	adrp	x0, l___func__.sort_i@PAGE
	add	x0, x0, l___func__.sort_i@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #61                         ; =0x3d
	adrp	x3, l_.str.1@PAGE
	add	x3, x3, l_.str.1@PAGEOFF
	bl	___assert_rtn
LBB0_2:                                 ; %cond.false
	b	LBB0_3
LBB0_3:                                 ; %cond.end
	ldur	w8, [x29, #-12]
	ldr	w9, [sp, #16]
	subs	w8, w8, w9
	b.ge	LBB0_5
	b	LBB0_4
LBB0_4:                                 ; %if.then
	ldur	w8, [x29, #-12]
	ldr	w9, [sp, #16]
	add	w8, w8, w9
	mov	w9, #2                          ; =0x2
	sdiv	w8, w8, w9
	str	w8, [sp, #12]
	ldur	x0, [x29, #-8]
	ldur	w1, [x29, #-12]
	ldr	w2, [sp, #12]
	bl	_sort_i
	ldur	x0, [x29, #-8]
	ldr	w8, [sp, #12]
	add	w1, w8, #1
	ldr	w2, [sp, #16]
	bl	_sort_i
	ldur	x0, [x29, #-8]
	ldur	w1, [x29, #-12]
	ldr	w2, [sp, #12]
	ldr	w3, [sp, #16]
	bl	_merge_i
	b	LBB0_5
LBB0_5:                                 ; %if.end
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function merge_i
_merge_i:                               ; @merge_i
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	w1, [x29, #-12]
	stur	w2, [x29, #-16]
	stur	w3, [x29, #-20]
	ldur	x8, [x29, #-8]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB1_2
	b	LBB1_1
LBB1_1:                                 ; %cond.true
	adrp	x0, l___func__.merge_i@PAGE
	add	x0, x0, l___func__.merge_i@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #73                         ; =0x49
	adrp	x3, l_.str.1@PAGE
	add	x3, x3, l_.str.1@PAGEOFF
	bl	___assert_rtn
LBB1_2:                                 ; %cond.false
	b	LBB1_3
LBB1_3:                                 ; %cond.end
	ldur	w8, [x29, #-12]
	ldur	w9, [x29, #-16]
	subs	w8, w8, w9
	cset	w8, gt
	tbz	w8, #0, LBB1_5
	b	LBB1_4
LBB1_4:                                 ; %cond.true7
	adrp	x0, l___func__.merge_i@PAGE
	add	x0, x0, l___func__.merge_i@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #74                         ; =0x4a
	adrp	x3, l_.str.2@PAGE
	add	x3, x3, l_.str.2@PAGEOFF
	bl	___assert_rtn
LBB1_5:                                 ; %cond.false8
	b	LBB1_6
LBB1_6:                                 ; %cond.end9
	ldur	w8, [x29, #-16]
	add	w8, w8, #1
	ldur	w9, [x29, #-20]
	subs	w8, w8, w9
	cset	w8, gt
	tbz	w8, #0, LBB1_8
	b	LBB1_7
LBB1_7:                                 ; %cond.true16
	adrp	x0, l___func__.merge_i@PAGE
	add	x0, x0, l___func__.merge_i@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #75                         ; =0x4b
	adrp	x3, l_.str.3@PAGE
	add	x3, x3, l_.str.3@PAGEOFF
	bl	___assert_rtn
LBB1_8:                                 ; %cond.false17
	b	LBB1_9
LBB1_9:                                 ; %cond.end18
	ldur	w8, [x29, #-16]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	add	w8, w8, #1
	stur	w8, [x29, #-24]
	ldur	w8, [x29, #-20]
	ldur	w9, [x29, #-16]
	subs	w8, w8, w9
	stur	w8, [x29, #-28]
	add	x0, sp, #40
                                        ; kill: def $x8 killed $xzr
	str	xzr, [sp, #40]
	add	x8, sp, #32
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	str	xzr, [sp, #32]
	ldur	w8, [x29, #-24]
	add	w1, w8, #1
	bl	_mem_alloc
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldur	w8, [x29, #-28]
	add	w1, w8, #1
	bl	_mem_alloc
	ldr	x8, [sp, #40]
	cbz	x8, LBB1_11
	b	LBB1_10
LBB1_10:                                ; %lor.lhs.false
	ldr	x8, [sp, #32]
	cbnz	x8, LBB1_12
	b	LBB1_11
LBB1_11:                                ; %if.then
	add	x0, sp, #40
	bl	_mem_free
	add	x0, sp, #32
	bl	_mem_free
	b	LBB1_20
LBB1_12:                                ; %if.end
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-12]
	add	x0, x8, x9, lsl #2
	ldr	x1, [sp, #40]
	ldur	w2, [x29, #-24]
	bl	_copy_i
	ldur	x8, [x29, #-8]
	ldur	w9, [x29, #-16]
	add	w9, w9, #1
	add	x0, x8, w9, sxtw #2
	ldr	x1, [sp, #32]
	ldur	w2, [x29, #-28]
	bl	_copy_i
	ldr	x9, [sp, #40]
	ldursw	x10, [x29, #-24]
	mov	w8, #-1                         ; =0xffffffff
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #32]
	ldursw	x10, [x29, #-28]
	str	w8, [x9, x10, lsl #2]
	str	wzr, [sp, #28]
	str	wzr, [sp, #24]
	ldur	w8, [x29, #-12]
	str	w8, [sp, #20]
	b	LBB1_13
LBB1_13:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #20]
	ldur	w9, [x29, #-20]
	subs	w8, w8, w9
	b.gt	LBB1_19
	b	LBB1_14
LBB1_14:                                ; %for.body
                                        ;   in Loop: Header=BB1_13 Depth=1
	ldr	x8, [sp, #40]
	ldrsw	x9, [sp, #28]
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #32]
	ldrsw	x10, [sp, #24]
	ldr	w9, [x9, x10, lsl #2]
	subs	w8, w8, w9
	b.hi	LBB1_16
	b	LBB1_15
LBB1_15:                                ; %if.then42
                                        ;   in Loop: Header=BB1_13 Depth=1
	ldr	x8, [sp, #40]
	ldrsw	x9, [sp, #28]
	ldr	w8, [x8, x9, lsl #2]
	ldur	x9, [x29, #-8]
	ldrsw	x10, [sp, #20]
	str	w8, [x9, x10, lsl #2]
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB1_17
LBB1_16:                                ; %if.else
                                        ;   in Loop: Header=BB1_13 Depth=1
	ldr	x8, [sp, #32]
	ldrsw	x9, [sp, #24]
	ldr	w8, [x8, x9, lsl #2]
	ldur	x9, [x29, #-8]
	ldrsw	x10, [sp, #20]
	str	w8, [x9, x10, lsl #2]
	ldr	w8, [sp, #24]
	add	w8, w8, #1
	str	w8, [sp, #24]
	b	LBB1_17
LBB1_17:                                ; %if.end52
                                        ;   in Loop: Header=BB1_13 Depth=1
	b	LBB1_18
LBB1_18:                                ; %for.inc
                                        ;   in Loop: Header=BB1_13 Depth=1
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB1_13
LBB1_19:                                ; %for.end
	add	x0, sp, #40
	bl	_mem_free
	add	x0, sp, #32
	bl	_mem_free
	b	LBB1_20
LBB1_20:                                ; %return
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function copy_i
_copy_i:                                ; @copy_i
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	w2, [sp, #12]
	ldr	x8, [sp, #16]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB2_2
	b	LBB2_1
LBB2_1:                                 ; %cond.true
	adrp	x0, l___func__.copy_i@PAGE
	add	x0, x0, l___func__.copy_i@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #110                        ; =0x6e
	adrp	x3, l_.str.4@PAGE
	add	x3, x3, l_.str.4@PAGEOFF
	bl	___assert_rtn
LBB2_2:                                 ; %cond.false
	b	LBB2_3
LBB2_3:                                 ; %cond.end
	ldur	x8, [x29, #-8]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB2_5
	b	LBB2_4
LBB2_4:                                 ; %cond.true7
	adrp	x0, l___func__.copy_i@PAGE
	add	x0, x0, l___func__.copy_i@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #111                        ; =0x6f
	adrp	x3, l_.str.5@PAGE
	add	x3, x3, l_.str.5@PAGEOFF
	bl	___assert_rtn
LBB2_5:                                 ; %cond.false8
	b	LBB2_6
LBB2_6:                                 ; %cond.end9
	str	wzr, [sp, #8]
	b	LBB2_7
LBB2_7:                                 ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	subs	w8, w8, w9
	b.ge	LBB2_10
	b	LBB2_8
LBB2_8:                                 ; %for.body
                                        ;   in Loop: Header=BB2_7 Depth=1
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #8]
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #16]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	b	LBB2_9
LBB2_9:                                 ; %for.inc
                                        ;   in Loop: Header=BB2_7 Depth=1
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB2_7
LBB2_10:                                ; %for.end
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l___func__.sort_i:                      ; @__func__.sort_i
	.asciz	"sort_i"

l_.str:                                 ; @.str
	.asciz	"sort_i.c"

l_.str.1:                               ; @.str.1
	.asciz	"A"

l___func__.merge_i:                     ; @__func__.merge_i
	.asciz	"merge_i"

l_.str.2:                               ; @.str.2
	.asciz	"p <= q"

l_.str.3:                               ; @.str.3
	.asciz	"(q + 1) <= r"

l___func__.copy_i:                      ; @__func__.copy_i
	.asciz	"copy_i"

l_.str.4:                               ; @.str.4
	.asciz	"dest"

l_.str.5:                               ; @.str.5
	.asciz	"source"

.subsections_via_symbols
