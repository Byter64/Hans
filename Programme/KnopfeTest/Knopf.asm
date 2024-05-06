.section Start

ADDI R1, R0, 1
SLLI R1, R1, 29 ; Store LED
ADDI R2, R0, 1
SLLI R2, R1, 30 ; Load Buttons
ADDI R3, R0, 0 ; Speicher Knopfe
Loop:
LOAD R3, R2, 0
STORE R1, R3, 0 
jmp Loop 