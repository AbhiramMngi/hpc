# Apple Silicon (ARM64) Assembly Manual

## 1. Architecture Overview (M1/M2/M3)
Apple Silicon chips use the **ARMv8-A (AArch64)** architecture. Unlike x86 (Intel), this is a **RISC** (Reduced Instruction Set Computer) architecture, meaning instructions are fixed-width (32-bit) and generally perform simpler, faster operations.

### Register File
| Name | Size | Description |
| :--- | :--- | :--- |
| **X0 - X30** | 64-bit | General purpose integers and pointers. |
| **W0 - W30** | 32-bit | The lower 32 bits of X registers. Writing to W0 zeroes the top 32 bits of X0. |
| **V0 - V31** | 128-bit | Vector/FP registers. Accessed as `Q` (128), `D` (64), `S` (32), `H` (16), `B` (8). |
| **SP** | 64-bit | Stack Pointer. Must be 16-byte aligned when accessing memory. |
| **PC** | 64-bit | Program Counter (Current instruction address). You cannot write to this directly. |
| **XZR / WZR** | - | Zero Register. Reading gives 0. Writing discards the data. |

### Register Slices (NEON/Float)
The 128-bit vector registers (`V0`-`V31`) can be accessed in different widths. These overlap (e.g., S0 is the bottom half of D0).
*   **Q0 - Q31**: 128-bit (Quad-word)
*   **D0 - D31**: 64-bit (Double-word)
*   **S0 - S31**: 32-bit (Single-word)
*   **H0 - H31**: 16-bit (Half-word)
*   **B0 - B31**: 8-bit (Byte)

---

## 2. Common Addressing Modes
Understanding how to access memory is critical for ARM64.

| Syntax | Name | Action | Example |
| :--- | :--- | :--- | :--- |
| `[x0]` | Base | Load from address in X0. | `ldr x1, [x0]` |
| `[x0, #8]` | Base + Offset | Load from address (X0 + 8). X0 does **not** change. | `ldr x1, [x0, #8]` |
| `[x0, x2]` | Register Offset | Load from address (X0 + X2). | `ldr x1, [x0, x2]` |
| `[x0, x2, lsl #3]` | Shifted Offset | Load from (X0 + (X2 << 3)). Great for array indexing. | `ldr x1, [x0, x2, lsl #3]` |
| `[x0, #8]!` | Pre-Indexed | Update X0 to (X0+8), *then* load. | `ldr x1, [x0, #8]!` |
| `[x0], #8` | Post-Indexed | Load from X0, *then* update X0 to (X0+8). Great for loops. | `ldr x1, [x0], #8` |

---

## 3. Instruction Reference

### Data Movement
| Opcode | Operands | Description |
| :--- | :--- | :--- |
| `MOV` | `x0, x1` | Move register to register. |
| `MOV` | `x0, #10` | Move immediate value (up to 16 bits) into register. |
| `MOVK` | `x0, #0xF, lsl #16` | Move 16-bit immediate into specific position, keeping other bits. |
| `ADR` | `x0, label` | Load relative address of a label (local range). |
| `ADRP` | `x0, label@PAGE` | Load Page Address (4KB aligned). Used with `ADD` for globals. |

### Memory Access
| Opcode | Operands | Description |
| :--- | :--- | :--- |
| `LDR` | `x0, [x1]` | Load Register (64-bit). |
| `LDRB` | `w0, [x1]` | Load Byte (8-bit) into W0. |
| `STR` | `x0, [x1]` | Store Register. |
| `LDP` | `x0, x1, [sp]` | Load Pair. Loads two registers from memory at once. |
| `STP` | `x0, x1, [sp, #-16]!` | Store Pair. Essential for pushing to stack. |

### Arithmetic & Logic
| Opcode | Operands | Description |
| :--- | :--- | :--- |
| `ADD` | `x0, x1, x2` | X0 = X1 + X2 |
| `SUB` | `x0, x1, #5` | X0 = X1 - 5 |
| `MUL` | `x0, x1, x2` | X0 = X1 * X2 |
| `SDIV` | `x0, x1, x2` | X0 = X1 / X2 (Signed) |
| `AND` | `x0, x1, x2` | Bitwise AND |
| `ORR` | `x0, x1, x2` | Bitwise OR |
| `LSL` | `x0, x1, #2` | Logical Shift Left (Multiply by power of 2). |

### Control Flow
| Opcode | Operands | Description |
| :--- | :--- | :--- |
| `CMP` | `x0, x1` | Compare X0 and X1. Sets flags (NZCV). |
| `B.EQ` | `label` | Branch if Equal. |
| `B.GT` | `label` | Branch if Greater Than. |
| `B` | `label` | Unconditional Branch. |
| `BL` | `function` | Branch with Link. Calls function (saves return addr to LR). |
| `RET` | - | Return. Jumps to address in LR (Link Register). |

---

## 4. Sample Program: Summing an Array
This program defines an array of long integers (64-bit), sums them up, and prints the result using the C library `printf`.

**Filename:** `sum_array.s`

