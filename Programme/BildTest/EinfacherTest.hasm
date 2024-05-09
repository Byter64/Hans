.section Test

add R1, R0, R0	 ;Pixeladresse
addi R2, R0, 255 ;Pixelfarbe (weiß)
addis R3, R0, 0xFFFF ;Maske, obere 16 Bit sind 1
addis R4, R0, 0x00FF   ;Maske, x Position
addis R5, R0, 0xFF00   ;Maske, y Position

Schleife:
addi R1, R1, 256

SetzePixel:
and R31, R1, R3 ;Hole Pixeladresse
ce R31, R31, R1
bez R31, Schleife ;Wenn R1 & 0xFFFF0000 != R1 ist, wiederhole

store R1, R2, 0
jmp Schleife