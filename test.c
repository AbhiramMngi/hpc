#include<stdio.h>
#include<stdint.h>
#include <math.h>

#define SIZE (1 << 16)
void test(uint8_t * restrict a, const uint8_t * restrict b) {
    uint64_t i;

    a = __builtin_assume_aligned(a, 32);
    b = __builtin_assume_aligned(b, 32);

    for (i = 0; i < SIZE; i++) {
        a[i] += b[i];
    }
}

int main() {
    uint8_t a[SIZE] __attribute__((aligned(32)));
    uint8_t b[SIZE] __attribute__((aligned(32)));

    for (int i = 0; i < SIZE; i++) {
        a[i] = i % 256;
        b[i] = (SIZE - i) % 256;
    }

    test(a, b);
    return 0;
}