G28 W	; home without ABL
G1 Y212 X245 Z10 F7000 ; move axis
G1 Z210 F1500 ; raise Z-axis
M907 Y800 X800 ; increase Y+X-motor current temporarily
G1 X210 F800 ; move X-axis
G4 ; wait until all movements are finished
M300	; beep once
M0 Calibrate ejector arm endstop	; click to continue event


G1 X247.5 F800 ; move X-axis
M907 Y540 X540 ;reset Y+X-motor current
G1 Z50 F1000 ; lower Z-axis
G1 X125 Y212 F10000 ; move X-axis
;--------------------------------------

M84 ; disable motors
