  .syntax unified
  .cpu cortex-m3
  .fpu softvfp
  .thumb

.global _reset

.word 0x00000000
.word _reset+1

_reset:
  LDR R0, = (0x40021000 + 0x18)
  LDR R1, [R0]
  ORR.W R1, R1, #(1<<3)
  STR R1, [R0]

  LDR R0, = (0x40010c00 + 0x00)
  LDR R1, [R0]
  ORR.W R1, R1, #(1<<20)
  STR R1, [R0]

  LDR R2, = (0x40010c00 + 0x0c)

loop:
  LDR R1, [R2]
  ORR.W R1, R1, #(1<<5)
  STR R1, [R2]

  LDR R0, = 1000000
  BL delay

  LDR R1, [R2]
  BIC.W R1, R1, #(1<<5)
  STR R1, [R2]

  LDR R0, = 1000000
  BL delay

  b loop

delay:
  SUBS R0, R0, #1
  BNE delay
  BX LR
