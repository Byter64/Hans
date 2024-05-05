.section Ball

BallPositionX:
.int 0
BallPositionY:
.int 0
BallGeschwX:
.int 1
BallGeschwY:
.int 1

Update:
Load R1, R0, BallPositionX@l
Load R2, R0, BallPositionY@l
Slli R3, R2, 8
Add R3, R3, R30
Add R3, R3, R1 ;Alte Ballposition
Store R3, R0, 0 ;alten Ballpixel löschen


Load R3, R0, BallGeschwX@l
Add R1, R1, R3



Add R1, R1, R2
