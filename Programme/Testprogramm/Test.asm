.section Test
.set BILD_BREITE, 160
.set BILD_HOEHE, 120

add R1, R0, R0	 ;Pixeladresse
addi R2, R0, 255 ;Pixelfarbe (weiß)
addis R3, R0, 0xFFFF ;Maske, obere 16 Bit sind 1
addis R4, R0, 0x00FF   ;Maske, x Position
addis R5, R0, 0xFF00   ;Maske, y Position
addis R6, R0, BILD_BREITE
addis R7, R0, BILD_HOEHE

Schleife:
addi R1, R1, 1

and R31, R1, R4
ce R31, R31, R6
bez R31, PruefeY
;Falls x Pos == 160:
addis R1, R1, -BILD_BREITE
addis R1, R1, 0x100

PruefeY:
and R31, R1, R6
ce R31, R31, R7
bez R31, SetzePixel
;Falls y Pos == 120:
addis R1, R1, -BILD_HOEHE

SetzePixel:
and R31, R1, R3 ;Hole Pixeladresse
ce R31, R31, R1
bez R31, Schleife ;Wenn R1 & 0xFFFF0000 != R1 ist, wiederhole

store R1, R2, 0
jmp Schleife