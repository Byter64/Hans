.section Gegner

GegnerPositionY: .int 20
.set GegnerLaenge 40
.set GegnerGeschwindigkeit 1
GegnerAktuallisieren:
;Speicher Register, erhoehe Stackpointer
SUBI R31, R31, 5 ; Stackpoint = Stackpoint - 5
Store R31, R1, 1
Store R31, R2, 2
Store R31, R3, 3
Store R31, R4, 4
Store R31, R5, 5

;Ende Speicher Register
;Lade Wichtige Werte
Load R1, R0, GegnerPositionY@l ; R1=Y1
Load R3, R0, BallPositionY@l; R3=BY
;Logik
ADDI R4, R0, BallGroesse; R4 = BallGroesse
SRLI R4, R4, 1;R4 = R4 >> 1 = R4/2
ADD R4, R4, R3;R4=R4+R3 => R4= Mitte vom Ball
ADDI R2, R0, GegnerLaenge; R2 = GegnerLaenge
SRLI R2, R2, 1;R2 = R2 >> 1 = R2/2
ADD R2, R2, R1;R2=R2+R1 => R2 = Mitte vom Gegner
;if(R2 == R4) mache nichts -> jump ende
CE R5, R2, R4; R5= R2==R4
BNEZ R5, EndeVonGegner; Jump ende
;else{
;if(R2>R4) GegnerY > BallY {
CG R5, R2, R4;R5=R2>R4
BEZ R5, GegnerUeberBall;jmp R2<R4
GegnerUnterBall:
SUBI R1, R1, GegnerGeschwindigkeit ; Y = Y - GegnerGeschwindigkeit
CLI R5, R1, SpielRandOben; if(Y<SpielRandOben)
BEZ EndeVonGegner;Y>= SpielRandOben -> jmp EndeVonGegner
ADDI R1, R0, SpielRandOben ; Y = SpielRandOben
JMP EndeVonGegner ; Beende Logik 
;} else {
GegnerUeberBall: ; R2<R4 => Gegner < BallY
ADDI R1, R1, GegnerGeschwindigkeit; R1 = neueGegnerPositionY
ADDI R2, R1, GegnerLaenge; R2 = neueGegnerPositionY + GegnerLaenge = neueGegnerPositionYUnten
CGI R5, R2, SpielRandUnten; if(Y>SpielRandUnten)
BEZ EndeVonGegner ; Y<= SpielRandUnten -> jmp EndeVonGegner
ADDI R1, R0, SpielRandUnten; R1 = SpielRandUnten
;}}

EndeVonGegner:
;Speicher alle Daten
Store R0, R1, GegnerPositionY@l; Speicher GegnerPositionY

;Beschreibe Register und reduziere Stackpointer
Load R1, R31, 1
Load R2, R31, 2
Load R3, R31, 3
Load R4, R31, 4
Load R5, R31, 5
ADDI R31, R31, 5; Stackpointer = Stackpointer + 5

JREG R30; Springe zurück