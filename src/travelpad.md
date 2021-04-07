# Travel Pad

March 2021

A full-sized dance pad can be a bit heavy and unwieldly so why not make a mini
pad. Some people call this a *travel pad*, which is an acceptable name if you're
already deep in the dance community. A quick search reveals that it's actually
more commonly used to a pad to change baby's diapers. Perhaps the term mini-pad
is snappier and memorable.  :D

Unlike a real pad, you can tuck it under your arm pits and carry it like a
skateboard.  Portable and functional. 

# Table of Contents

1. [Intro](#Introduction)
2. [Frame](#Frame)
3. [Electronics](#Electronics)
	1. [Sensors](#Sensors)
	2. [Circuits](#Circuits)
	3. [Of Noise and Entropy](#Of-Noise-and-Entropy)
	4. [Microcontroller](#Microcontroller)
4. [Assembly](#Assembly)
4. [Final Impressions](#Final-Impressions)
4. [Future Work](#Future-Work)
5. [Appendx](#Appendix)
	1. [Links](#Links)

## Introduction

There are so many existing resources on why you would be interested in using
Force-Sensing Resistors. The technology is relatively new, being developed in
1977 and manufactured from the 90s. The operation of the force depends on
_quantum tunneling_. The main advantage of the sensor is form factor which is
paper thin, its low cost and its good shock resistance.  Compared to Load cells
used in [openpad](openpad.html), it's easier to integrate into firmware as it
can be directly interfaced with a 5V line. [^1]

One doesn't have to use FSRs for a mini pad. In the original Travel Pad in
Rembrandt's [Guide][2], original DDR rubber sensors are used along with the
rubber holders. However, acquiring those parts may be more tricky (finding a
domestic supplier) and more expensive (FSRs are $5 a pop) so this project uses
FSR.

## Frame

Being a travel pad means that the frame is smaller and easier to build. I made
mines out of 2x4 pine, which is the cheapest one in my local hardware shop. My
dimensions are just a bit smaller than Rembrandt's but the width of the panel
was designed to be the same width as the 2x4 block. This made constructing the
base very simple. Dowel joinery is used with a jig and base is glued. A full
sized solid 3/4" panel is used as the center. 

## Appendix

### Links

a. Sereni's Mechanical FSR Guide on [github][1] b. Renbrandt's Travel Pad Guide
[google docs][2] c. Teejusb arduino/teensey firmware on [github][3] d. Dom ITG's
informational videos playlist on [youtube][5] e. greentea's hack on cutting up
FSR on [youtube][6] e. Good source of FSR for US [shop][4]

[1]: https://github.com/Sereni/fsr-pad-guide
[2]: https://docs.google.com/document/d/1Ho82WgAU57NnZQTG75v4WbRqosCPmwy7r1IAPUC4vxU/
[3]: https://github.com/nabulator/fsr
[4]: https://buyinterlinkelectronics.com/
[5]: https://www.youtube.com/watch?v=Z_x7HFaBBUg&list=PL2vUwLUVuyIy4CD8DEwS7oZ_Y41vyYWW/
[6]: https://www.youtube.com/watch?v=uB9hqS_yGLc


[^1]: I know that electronic piano keyboards have pressure sensitivity detection
  to simulate loudness dynamics of a real piano's hammer action -- through it's
  strangely titled *velocity*. Turns out these keyboards don't have a singular
  sensitivity sensor to acquire this data. Instead, there are two contacts in a
  single key which are placed at different distances from the receiver. Thus,
  the firmware literally measures the velocity of the strike by taking the
  different in time and assigning the Note trigger ON a velocity value based on
  that timing difference. Needless to say, this probably won't give us what
  dance players are looking for, a sharp hysteresis curve. 
