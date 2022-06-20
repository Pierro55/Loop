G28 W	; home without ABL
G1 Y212 X245 Z10 F7000 ; move Y-axis
G1 Z210 F1500 ; raise Z-axis
M907 Y800 X800 ; increase Y+X-motor current temporarily
G1 X210 F800 ; move X-axis

; wiggle motion
G1 Y-4 F2500 ; move Y-axis
G1 Y210 F20000 ; move Y-axis
G28 Y ;home Y to knock off lose objects
G28 Y ;home Y to knock off lose objects
G28 Y ;home Y to knock off lose objects
G1 Y-4 ; move Y-axis
G1 Y155 ; move Y-axis


G1 X247.5 F800 ; move X-axis
M907 Y540 X540 ;reset Y+X-motor current
G1 Z50 F1000 ; lower Z-axis
G1 X125 Y212 F10000 ; move X-axis
;--------------------------------------

M84 ; disable motors