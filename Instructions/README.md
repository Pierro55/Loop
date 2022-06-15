# Loop Instructions

## Crucial information

- Calibrate your Z-offset to get a good first layer (too close to the bed makes the prints adhere more which we don't want)
- Choose the right material and brand.  I've tested so far: ABS, PETG, CF-PETG, PLA. The quality from various vendors can differ, make sure to test new materials first (even if they are the same material type)
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

8)
