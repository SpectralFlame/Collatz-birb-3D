# Collatz birb 3D
A visualization of the collatz conjecture in 3D (using PeasyCam)

It is called Collatz birb because it looks like a chicken (depending on the rotation, the rotation is set so that it shows the chicken on startup)

![collatz-chick](https://i.imgur.com/oAxArLX.png "calculated using N=100,000")

This visualization is made by looking at 3 consecutive numbers in the sequence and rotating about an axes based on the parity of the number.
The first number will rotate around the X axis, the second around the Y axis and the third around the Z axis.
The angles are chosen to be the same as the ones used in the Numberphile video, namely `PI/13` when even and `-PI/20` when odd.

Interestingly enough, when choosing equal angles for odd and even rotation, you still get more rotation in one direction, which would indicate that there are more even numbers than odd numbers (did not check this, just an assumption).

If you want to play around with some of the settings, here's a short description:

Variable | Description
-------- | -----------
N | maximum value of n
L | Length of an individual line
W | Width of each line
rmin | minimum value of red (gmin and bmin for green and blue)
rmax | maximum value of red (gmax and bmax for green and blue)
rvar | variation of red (gvar and bvar for green and blue)
axe | angle of X rotation when even (aye and aze for Y and Z rotation)
axo | angle of X rotation when odd (ayo and azo for Y and Z rotation)
