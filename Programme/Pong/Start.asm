.section Start

Addi R31, R0, 65535 ;Stapelzeiger
Addi R30, R0, 0 ;Rücksprungadresse
Addi R29, R0, 1 ;Bildpufferadresse
Slli R29, R29, 31
Addi R28, R0, 1 ;Knopfadresse
Slli R28, R28, 30

SpielSchleife:
Jal R30, BildpufferLoeschen
Jmp SpielSchleife

SpielEnde:
Jmp SpielEnde