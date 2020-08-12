#Openpad Build

July 2020

# Table of Contents
1. [Intro](#Introduction)
2. [Frame](#Frame)
3. [Electronics](#Electronics)
	1. [Sensors](#Sensors)
	2. [Circuits](#Circuits)
	3. [Of Noise and Entropy](#Of-Noise-and-Entropy)
	4. [Microcontroller](#Microcontroller)
4. [Lessons](#Lessons)
5. [Links](#Links)

## Introduction

I grew up with a game called Dance Dance Revolution at home and cycled through 
several foam pads. Flimsy fabric ripped easily and pads were not well anchored, often
drifting during play. Real arcade pads are built from rugged metal frames, came with 
sturdy bar that supports human weight and are bulky (100kg total). Building your own pads
provides a balance between portability, sturdiness and price. 

![an BlueShark pad with internal parts revealed](./img/blueshark.jpg) 

-> TODO: `Do` a teardown / analysis section<-


There does exist many other hard dance pads you get on the market. Historically, two of
the best included Cobalt Flux pads and Blue Shark, both which are no longer manufactured 
and only available through second-hand markets. StepmaniaX (SMX) pads are also acquirable for
new, although they are pricey (US $1400+shipping) and notoriously out of stock.

They are small batches of pads at a mid range price point for a mid-tiered product but
you can probably do better for less money and some clever hacking. The old foam pads I had
from DDRgame fall into the classification of mid-tier pads.
  
The primary goals for this build is to:

* Support High level play (highly sensitive panels)
* Support USB host for PC interface 
* Be as cheap as possible 

As with any ''cost-efficient'' project, the pad was built up from the materials available
at hand, instead of specifying a design and buying all the parts upfront. Screws were
recycled and an old TV was also torn-down to save on material cost.

The source code and documentation needed to reproduce this project is available on the 
Openpad project on [Github][1]
originally pioneered by finalarcadia. I have forked and added a PCB design. 

## Frame


Metal is expensive. Metalworking tools -- also expensive. Wood? Cheap. A used miter saw
from Craigslist? $40. KJ drafted some designs in CAD. Inspired by games Arrow Vortex and
Technomotion where all 9 arrows in the 3x3 grid were used in gameplay, a modular design which each a square would be a self-contained and
attachable unit was designed. The idea was *if we wanted* we could play Pump it Up if we
rewired the pad like legos. 

![A single module](./img/pad2018design.jpg)

-> Old school DDR and PIU pads used two diagonal screws to secure the panel <-

The material of choice is 2x4, available in any US hardware store for as about as cheap as
wood can get. Unfortunately, the measurements in the design  required numerous cuts to be
made to get the wood to shape! A rather generously thick base was made too. As the 2x4s
needed to be cut into 1 inch measurements, lots of cuts had to be made to size it down. A
better approach would have been to modify the design to reduce the cuts needed of a 2x4.

Building the actual pad became **very** monotonous and I almost injured myself twice while
zoning out and neglecting safety. Exactly 9 squares brackets with glue butt joints. I was
also sloppy with gluing and the panels weren't completely level with the floor. This would
become an issue later when you string the pad together!

Alignment is a big issue when dealing with modular blocks so I built the alignment blocks
*first*, then glued then on while they were already coupled using heavy stones to clamp.
There were two M6 screws used to hold each edge of the module. Threads were tapped
directly into the thin wooden alignment blocks. This is fine when the pad is flat but when
the pad is standing vertically, it is slightly wobbling at several joints. 

![A single module with the mounting holes for the sensor](./img/padsinglemodule.jpg)

-> The first module made. This one looks **much** better than the rest. -> 

![The final assembled pad](./img/padend.jpg)

-> And here is the frame. Notice the use of bricks for clamping. <-

## Electronics
### Sensors

Up to this day, DDR and PIU have used digital sensors that are actuated by a metal
bracket underneath the acrylic panel. The bracket only allows vertical motion to be
registered. Pad maintenance will inevitably require padding the space to change
sensitivity thresholds. A new approach by the StepmaniaX team is their use of analog
sensors: load cells or
strain gauges that can detect minute tension or compression in the metal structure itself!
The sensors used in StepmaniaX and this project are beam shaped, which allows you to mount
the panel on the other side of the beam. I used some rubber feet to hold on the panel

![load cell](./img/padloadsensor.jpg)

-> Testing the load cell <-

Because the load cell uses a [Wheatstone bridge][2], the output of the signal is in
microvolts, too small to be measured by any microcontroller. We need to use a amplifier to
do the job. Here I use an opamp (which one?) that has four op amps. 

Why use a **analog** sensor? Because it allows you to configure arbitrary sensitivity in
software! At least so goes the theory. Unfortunately, new design brings new challenges.
Nothing is free in the world of engineering.

### Circuits
The connections on a bread board were to shaky for me so I went straight to the
protoboard. 

### Of Noise and Entropy

Yes, so we're doing an analog circuit so suddenly we have to worry about analog noise!
So make sure your sensors are shielded and your 5V clean. Keep wires short as possible.
Actually, I didn't do any of those things and my signal is workable. I 

### Microcontroller

Arduino is cheap and easy to program. The Arduino Uno (ATmega328 chip) is not powerful enough to support
USB profiling by it's own so you need to reprogram the side ATmega16u2 chip to use the secondary
chip as a USB host. Unfortunately, the latency is quite high for input (~50ms) and
debugging a chore. You need to short a jumper pin and reconnect the USB every time you want
to switch between keyboard and programmer so a more powerful Arduino Leonardo or even the
Pro Micro or Pico is recommended.

It is wise to add LED indicators as debugging via the Serial console can prove annoying.
Nothing like realtime visual feedback. 

![circuits](./img/padbadeletronics.jpg)

You see two arduinos here because one of them is just providing power. I think there
shouldn't be a need for this.

`TODO: CHECK`


## Assembly

![assembly](./img/padwithpanels.jpg)

So the panels were hand cut from a TV I picked up on CL. You could also just buy 3/4" acrylic
panels or 1/2" polycarbonate sheets and cut them on a bandsaw. I'm using 3/4" MDF panels
put they're actually so hard and hurt my feet.

## Lessons
* Modular design needs more precision
* USB  power considerations for circuit (typ. 100mA)
* probably should get a safer table saw


## Future Work
There is a lot to do!
New Features I want to add:

1. Lighting (externally powered LED's)
2. Thinner, flexible transparent panels with better mounting onto frame
3. Proper PCB
4. Just use the better arduino

# Links

a. [Github Source][1]
b. Wheatstone Bridge & Load Cells on [Wikipedia][2]

[1]: https://github.com/nabulator/openpad "Github Source"
[2]: https://en.wikipedia.org/wiki/Load_cell#Strain_gauge_load_cell "wheatstone bridge"

<!--- vim: set tw=80 -->
