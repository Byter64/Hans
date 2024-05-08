.section Anzeige

HintergrundFarbe: .int 64

BildpufferLoeschen:
;Gerettete Register: R1, R2, R3, R4
Subi R31, R31, 4
Store R31, R4, 4
Store R31, R3, 3
Store R31, R2, 2
Store R31, R1, 1

Load R1, R0, HintergrundFarbe ;Hohle Farbe
Add R2, R0, R0 ;R2 ist die Pixeladresse
Addi R4, R0, Spielhoehe
Slli R4, R4, 8

SpaltenLoeschen:
	ZeileLoeschen:
	Add R3, R2, R29
	Store R3, R1, 0

	Addi R2, R2, 1
	Andi R3, R2, 255
	cei R3, R3, Spielbreite
	bez R3, ZeileLoeschen

Subi R2, R2, Spielbreite ;Setze X auf 0
Addi R2, R2, 256

ce R3, R2, R4 ;Pixeladresse == Spielhoehe
bez R3, SpaltenLoeschen

;Das hier ist Debug!!!
Addi R1, R1, 1
Store R0, R1, HintergrundFarbe

Load R4, R31, 4
Load R3, R31, 3
Load R2, R31, 2
Load R1, R31, 1
Addi R31, R31, 4
Jreg R30