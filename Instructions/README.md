# Loop Instructions

## Crucial information

- Calibrate your Z-offset to get a good first layer (too close to the bed makes the prints adhere more which we don't want)
- Choose the right material and brand.  Check the . The quality from various vendors can differ, make sure to test new materials first (even if they are the same material type). Join my document on different material types --> [Material Data](https://docs.google.com/spreadsheets/d/1ghuwrelvSEJ2hHmYuEMqaSpLGjrf1bYgRo76JcQ4j_E/edit?usp=sharing)
- Calibrate the first layer temperature --> lower temperatures make the part stick less to the buildplate which we want
- Use the textured PEI spring steel sheet from Prusa (depending on the batch number, you might get different results)
- Make sure to wash your buildplate with dish soap every once in a while, and to not use any adhesives on the bed itself. 

## Build instructions

What worked best for me:

**a)** Insert all brass heat inserts (see [Heat_Inserts.pdf](https://github.com/Pierro55/Loop/blob/main/Instructions/Heat%20Insert%20Locations.pdf) for more information)

**b)** Mount the following parts beforehand:
- Belt tensioner Top RIGHT ++ Z-Axis Top RIGHT
- Bearing block TOP ++ Z Axis Top LEFT
- Ejection arm pivot point ++ Z Axis Bottom LEFT
- Ejection arm endtstop ++ Z Axis Bottom RIGHT (only pre-tighten for now)
- Ejector arm part 1 ++ Ejector arm part 2
- Top axis ++ Bearing block TOP ++ GT2 60T 8mm pulley ++ GT2 20T 8mm as shown in the picture below (without the belts)

<p align="center">
	<img src="https://github.com/Pierro55/Loop/blob/main/Images/Top_Left_Pulley_Assembly.JPG" width=50% height=50%>
</p>


**c)** Assembly instructions

1) Move the Z-Axis all the way up via the LCD and fix the X-gantry with tape or zip ties to the frame

2) Mount the feet and the mechanics cover first while laying the machine on the PSU side, flip the machine around afterwards

3) Cut the zip ties from the Z-motor cables --> unscrew the Z-axis motor mounts --> unscrew the Z-axis rod --> unscrew the Z-axis brackets and change them with 		the mod parts --> reverse all steps

4) Cut the zip ties/tape from the X-gantry --> move the Z-Axis down manually roughly to Z=150mm --> unscrew all top Parts and change them with the mod parts 		(including the mechanism gripper)
	
5) Mount the top belt first --> tighten the loose ends with the top screw of the mechanism gripper --> Make sure that the Belt Idler top RIGHT does not 		interfere with the mechanism gripper when the gripper is on its idle position (see picture below) --> tighten the Belt Idler top RIGHT until you the belt has 	reasonable tension (**Notice: The idle position of the mechansim gripper is flat against the Z_Axis_top_RIGHT part**)
<p align="center">
	<img src="https://github.com/Pierro55/Loop/blob/main/Images/Idle_Position_Sledge.JPG" width=50% height=50%>
</p>	

6) Mount the ejector arm --> slide the mounted ejector arm over the GT2 20T 8mm bore pulley so that it sits where the GT2 belt would normally be located (set screws are accessible) --> Insert that into the ejection arm pivot point and slide the 8mm shaft in from the outside --> tighten the setscrews --> slide the ejector arm over the set screws of the GT2 Pulley and tighten the clamp of the arm

7) Mount the ejector belt --> slide the 69cm belt thorugh the pivot point and the GT2 pulley (teeth side of the belt facing the teeth of the pulley) --> mount the GT2 belt tensioner 1+2 att each on end of the belt (orientation doesn't matter) --> lay one end around the upper pulley --> connect the two tensioners via two M3x18mm screws --> tighten the screws until the belt has reasonable tension

8) Mount the LCD either to the left or right side of the machine

8) Calibrate the system --> loose the top GT2 20T pulley --> move the ejector arm the the outermost left position (idle position) --> move the mechanism gripper to its idle position and move it back about 1-2mm --> tighten the set screws of the top pulley --> move the mechanism gripper to its idle positon by hand --> perform a Z-Axis calibration via the LCD

## Adding a printing queue

For full functionallity you need a Raspberry Pi or something else that can run Octoprint. 
I suggest using a raspberry Pi zero 2W because you can install it directly onto the Prusa motherboard. 

Here are the instructions for installing a raspberry Pi zero 2W [Instructions RPI Zero](https://help.prusa3d.com/article/prusaprint-rpi-zero-and-octoprint_2180)

If you are using a different SBC, here are instuctions on how to get Octoprint running [Instructions Octoprint](https://octoprint.org/download/)

## Slicer Settings
Because of the way this is buld, some build volume is lost
- Change the buildvolume to Y-max 185mm and Z-max 194mm (Printer Settings --> General --> Bed shape for Y-setting, Max print height for Z-setting)

You can still print the whole X and Y volume if you just print with a normal Prusa printer profile. Make sure to limit the Z-axis to 194mm. I suggest saving a seperate "Printer Setting" if you wish to print bigger occasinally with the mod disabled.

### Copy the following Gcode to your Start Gcode in Prusa Slicer (Printer Settings --> Custom G-code --> Start G-code)
```
M862.3 P "[printer_model]" ; printer model check
M862.1 P[nozzle_diameter] ; nozzle diameter check
M115 U3.10.1 ; tell printer latest fw version
G90 ; use absolute coordinates
M83 ; extruder relative mode
G28 W ; home all without mesh bed level
G1 Z20 F1000 ;raise Z axis
G1 Y212 F10000 ;move bed to idle position
;M140 S[first_layer_bed_temperature] ; set bed temp
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S170 ;wait for extruder temp for ABL
G80 ; mesh bed leveling
G1 Z15 F1000 ;raise Z axis
M104 S[first_layer_temperature] ; set extruder temp
M109 S[first_layer_temperature] ; wait for extruder temp

;----Intro line sequence------
G1 Z0.2 F720 ;raise Z axis
G1 Y-3 F1000 ; go outside print area
G92 E0 ;zero extruder
G1 X80 F10000 ; move X-axis
G1 E5 F1000; prime the nozzle
G1 X180 E21 ; intro line
G1 Z0.4 F720 ;raise Z axis
G1 X80 E21 F1000 ; intro line
G1 Z0.8 F720 ;raise Z axis
G1 X180 E21 F1000 ; intro line
G1 Z1.2 F720 ;raise Z axis
G1 X80 E21 F1000 ; intro line
G1 Z1.6 F720 ;raise Z axis
G1 X180 E21 F1000 ; intro line
G1 Z2 F720 ;raise Z axis
G1 X80 E21 F1000 ; intro line
G1 X70 F10000 ; quickly move away from intro line
G1 E-0.8 ;retract
G92 E0 ;zero extruder
;--------------------------------------

M221 S{if layer_height<0.075}100{else}95{endif}
```

### Copy the following Gcode to your End Gcode in Prusa Slicer (Printer Settings --> Custom G-code --> End G-code), make sure to change the release temperature according your needs
```
G1 E-6 F1000 ;retract
G4 ; wait
M221 S100 ; reset flow
M900 K0 ; reset LA
{if print_settings_id=~/.*(DETAIL @MK3|QUALITY @MK3|@0.25 nozzle MK3).*/}M907 E538 ; reset extruder motor current{endif}
M104 S0 ; turn off temperature
M107 ; turn off fan
G1 Y212 F10000 ; move Y-axis
{if max_layer_z < max_print_height}G1 Z{z_offset+min(max_layer_z+5, max_print_height)}{endif} ; Move print head up

;-----Automatic ejection sequence------
M190 R32 ; wait for bed temp !!CHANGE THIS TO YOUR SPECIFIC RELEASE TEMPERATURE!!
G1 X245 F7000 ; move X-axis
G1 Z210 F1500 ; raise Z-axis
M907 Y800 X800 ; increase Y+X-motor current temporarily
G1 X210 F800 ; move X-axis

; wiggle motion
G1 Y-4 F2500 ; move Y-axis
G1 Y210 F20000 ; move Y-axis
G28 Z ;home Y to knock off lose objects
G28 Z ;home Y to knock off lose objects
G28 Z ;home Y to knock off lose objects
G1 Y-4 ; move Y-axis
G1 Y155 ; move Y-axis

M907 Y540 X540 ;reset Y+X-motor current
G1 X247.5 F800 ; move X-axis
G1 Z50 F1000 ; lower Z-axis
G1 X125 Y212 F10000 ; move X-axis
;--------------------------------------

M140 S0 ; turn off heatbed
M84 ; disable motors
```
