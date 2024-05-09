.section Ball

BallPositionX: .int 60
BallPositionY: .int 60
BallGeschwX: .int 1
BallGeschwY: .int 1
.set BallGroesse, 2

BallAktuallisieren:
;Speicher Register erhoehe Stackpointer

SUBI R31, R31, 5 ; Stackpoint = Stackpoint - 5
Store R31, R1, 1
Store R31, R2, 2
Store R31, R3, 3
Store R31, R4, 4
Store R31, R5, 5


;Ende Speicher Register
;Lade Ball Positionen
Load R1, R0, BallPositionX@l ;R1 = X
Load R2, R0, BallPositionY@l ;R2 = Y
;Bewege Ball
Load R3, R0, BallGeschwX@l ;R3 = dX
Load R4, R0, BallGeschwY@l ;R4 = dY
Add R1, R1, R3 ;  X = X + dX berechne neues X
Add R2, R2, R4 ; Y = Y + dY brechne neues Y
;Schaue nach Koallision 
UeberpruefeBallKoallisionXLinks:
; if(X<SpielRandLinks)
CLI R5, R1, SpielRandLinks ; bool R5 = X < SpielRandLinks
BEZ R5, UeberpruefeBallKoallisionXRechts ; if(!R5) jmp UeberpruefeBallKoallisionXRechts else
ADDI R1, R0, SpielRandLinks;X = SpielRandLinks
MULI R3, R3, -1 ;BallGeschwX = - BallGeschwX
JMP UeberpruefeBallKoallisionYOben ; Da er links koallisiert ist muss er nicht nach rechts getestet werden

UeberpruefeBallKoallisionXRechts:
;if(X>SpielRandRechts)
ADDI R1, R1, BallGroesse ; X = X + BallGroesse
CGI R5, R1, SpielRandRechts; bool R5 = X > SpielRandRechts
BEZ R5, KorrigiereBallPositionX ; if(!R5) jmp UeberpruefeBallKoallisionYOben else
ADDI R1, R0, SpielRandRechts;X = SpielRandLinks
MULI R3, R3, -1 ;BallGeschwX = - BallGeschwX
KorrigiereBallPositionX:
SUBI R1, R1, BallGroesse ; X = X - BallGroesse

UeberpruefeBallKoallisionYOben:
; if(Y<SpielRandOben)
CLI R5, R2, SpielRandOben ; bool R5 = Y < SpielRandOben
BEZ R5, UeberpruefeBallKoallisionYUnten ; if(!R5) jmp UeberpruefeBallKoallisionYUnten else
ADDI R2, R0, SpielRandOben;Y = SpielRandOben
MULI R4, R4, -1 ;BallGeschwY = - BallGeschwY
JMP EndeBallKoallisionUeberpruefung ; Da er oben koallisiert ist muss nichts weiter gemacht werden

UeberpruefeBallKoallisionYUnten:
; if(Y>SpielRandUnten)
ADDI R2, R2, BallGroesse ; Y = Y + BallGroesse
CGI R5, R2, SpielRandUnten ; bool R5 = Y > SpielRandUnten
BEZ R5, KorrigiereBallPositionY ; if(!R5) jmp EndeBallKoallisionUeberpruefung else
ADDI R2, R0, SpielRandUnten;Y = SpielRandUnten
MULI R4, R4, -1 ;BallGeschwY = - BallGeschwY
KorrigiereBallPositionY:
SUBI R2, R2, BallGroesse ; Y = Y - BallGroesse

EndeBallKoallisionUeberpruefung:

;Speicher alle Daten
Store R0, R1, BallPositionX@l; Speicher X
Store R0, R2, BallPositionY@l; Speicher Y
Store R0, R3, BallGeschwX@l; Speicher dX
Store R0, R4, BallGeschwY@l; Speicher dY

;Beschreibe Register und reduziere Stackpointer
Load R1, R31, 1
Load R2, R31, 2
Load R3, R31, 3
Load R4, R31, 4
Load R5, R31, 5
ADDI R31, R31, 5; Stackpointer = Stackpointer + 5

JREG R30; Springe zurück