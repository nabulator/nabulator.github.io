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
4. [Assembly](#Assembly)
4. [Final Impressions](#Final-Impressions)
4. [Future Work](#Future-Work)
5. [Links](#Links)

## Introduction

I grew up with an arcade game called Dance Dance Revolution, which was a popular dancing game
simulator from 1997. I played the  home console version on my PlayStation and cycled through 
inferior soft, foam pads designed for causal home use. Flimsy fabric ripped easily and pads 
were not well anchored, often drifting during play. Needless to say, the home dance pads paled 
drastically when compared to hardened arcade pads, built out of rugged metal frames, with 
welded support bars, with 1-inch thick acrylic panels and diffused lights to light up the dance
floor. For most people, purchasing the real arcade game itself was out of the question.[^1] 

However, with the development of free-as-in-freedom software simulators such as the legendary
[Stepmania][3], along with proliferation of fan-made content, simfiles, which have spread.[^2]

Building arcade-style pads from scratch requires some labor but is feasible for an individual
equipped with a modest tool set and skill set. It is a worthwhile endeavor to design work around
functionality, durability and price constraints. 

![an BlueShark pad with internal parts revealed](./img/blueshark.jpg) 

-> Maybe in the future, I will discuss discuss a teardown of this Blue Shark <-


There do exist commercial "hard" dance pads that attempt to replicate arcade pads.
Historically, two of the top-tier products include the Cobalt Flux pads and Blue Shark
pads, both which are no longer manufactured and only available from second-hand markets.
Presently, they are mid-tier products at a mid-range price point but inferior in quality or
sensitivity or maintenance in one way or another. The old foam pads I had from DDRgame
fall into the classification of mid-tier pads. Arcade-style [StepmaniaX][4] (SMX) pads are
acquirable for new, although they are pricey (US $1400+shipping) and notoriously out of
stock.[^itg]
 
The primary goals for this build is to:

* Support High level play (highly sensitive panels)
* Support USB host for PC interface 
* Be as cheap as possible 

As with any ''cost-efficient'' project, the pad was built up from the materials available
at hand or the cheapest possible materials available at the local hardware store. This
contrasts to a typical engineering workflow in which you begin with a design, then specify
a BOM (Bill of Materials), prototype and iterate. 

As a consequence of the primary goals, major design choices followed naturally:

* Wood is the material of the frame and panels
* Analog sensors for software-defined sensitivity
* Arduino for microcontroller

The source code and documentation needed to reproduce this project is available on the
Openpad project on [Github][1] originally pioneered by finalarcadia. I have forked and
added a PCB design. 

## Frame

Metal is expensive. Metalworking tools -- also expensive.[^5] Wood? Cheap. A used miter saw
from craigslist? $40. My good friend, KJ helped draft some designs in CAD. Inspired by
games Arrow Vortex and Technomotion where all 9 arrows in the 3x3 grid were used in
gameplay, a modular design which each a square would be a self-contained and attachable
unit was designed. The idea was *if we wanted*, we could play Pump it Up or any arbitrary
configuration!

![A single module on paper](./img/pad2018design.jpg)

-> Old school DDR and PIU pads used two diagonal screws to secure the panel <-

The material of choice is 2x4 pine lumber, available in any US hardware store for as about as
cheap as wood can get. The measurements in the design were not sized to 2x4 very well,
thus numerous cuts were made to get the wood to shape! A rather generously thick base was
made by gluing four 2x4 beams together. Since 2x4's are meant to be used in constructing
buildings, it has rather rounder edges which I shaved off with the table saw. More wood
scraps! In retrospect, it would have been better to modify the design to reduce the cuts
needed. 

Building the individual modules became **very** monotonous and I almost injured myself
twice while zoning out and neglecting safety. Exactly 9 squares brackets with glue butt
joints holding everthyng together. I was also sloppy with gluing and the panels weren't
completely level with the floor. This would become an issue later when you string the pad
together!

Alignment is a big issue when dealing with modular blocks so I built the alignment blocks
*first*, then glued then on while they were already coupled using heavy stones and brikcs
to clamp.  There are two M6 screws used to hold each edge of the module. Threads were
tapped directly into the thin wooden alignment blocks. This is fine when the pad is flat
but when you hold the pad vertically, it is slightly wobbling at several joints. In my
mind though, disassembly for transporting was an important feature at the time. 

![A single module with the mounting holes for the sensor](./img/padsinglemodule.jpg)

-> The first module made. This one looks **much** better than the rest. <- 

![The final assembled pad](./img/padend.jpg)

-> Attaching the alignment blocks. Notice the use of bricks for clamping. <-

## Electronics
### Sensors

Up to this day, DDR and PIU have used rubber digital sensors that are actuated by a metal
bracket underneath the acrylic panel. The bracket only allows vertical motion to be
registered. Pad maintenance will inevitably require padding the space to change
sensitivity thresholds.[^4] A new approach by the StepmaniaX team is their use of analog
sensors: load cells or strain gauges that can detect minute tension or compression in the
metal structure itself!  The sensors used in StepmaniaX and this project are beam shaped,
which allows you to mount the panel on the other side of the beam. I used some rubber feet
to hold on the panel and also allows for adjusting of tension.

![load cell](./img/padloadsensor.jpg)

-> Testing the load cell circuit <-

Because the load cell uses a [Wheatstone bridge][2], the output of the signal is in
microvolts, too small to be measured by any microcontroller. We need to use a amplifier to
do the job. Here I use an opamp (which one?) that has four op amps. 

Why use a **analog** sensor? Because it allows you to configure arbitrary sensitivity in
software! At least so goes the theory. The panels ended up being a little too sensitive!
The sensors would sometimes register force from a diagonal module due to lateral forces
from the frame's uneven construction. Sometimes, just stading on the center panel can
trigger the other arrows! A temporary fix is to recalibrate and rezero the sensors while
standing on the center panel. 

### Circuits
The connections on a bread board were to shaky for me so I went straight to the
protoboard. Screw-in terminals were used for the analog input signals.

### Of Noise and Entropy

Because we're desiging an analog circuit we need to minimize our analog noise which our
microcontroller will read! Following standard analog design here wise.
So make sure your sensors are shielded and your 5V clean. Keep wires short as possible.
Another option is to use RC time constant to filter out noise but that could introduce
delay. Design a PCB and use bypass capacitors -- use a function generator and oscilloscope
to verify clean switching in your DAC. 

**Disclaimer: Actually, I didn't do any of those things and my pad works great.**

### Microcontroller

Arduino is cheap and easy to program. The Arduino Uno (ATmega328 chip) is not powerful
enough to support USB profiling by it's own so you need to reprogram the side ATmega16u2
chip to use the secondary chip as a USB host. Unfortunately, the latency is quite high for
input (~50ms) and debugging a chore. To switch between a keyboard and programmer function,
you need to short a jumper pin and reconnect the USB
every time. A more powerful Arduino Leonardo or even the Pro Micro or Pico is recommended.

It is wise to add LED indicators as debugging via the Serial console can prove annoying.
Nothing like realtime visual feedback. 

![circuits](./img/padbadeletronics.jpg)

You see two arduinos here because one of them is just providing power. I think there
shouldn't be a need for this but USB limits to 100mA by default and my op amp may draw up
to 50 mA of power. The arduino board itself also needs 50 mA so it's a close call and I
was definitely having stability issues where only a subset of the op-amps worked when
everything was powered through my laptop. The use of arduino pro micro or nano will have
lower power footprint than the uno. 


## Assembly

![assembly](./img/padwithpanels.jpg)

The panels were hand cut from a old projector TV. The plastic itself was only 1/32 " at
most so I supplemented it with 3/4" of MDF. Alternatively, 3/4" acrylic
panels or 1/2" polycarbonate sheets and cut them on a bandsaw. It turns it it actually
hurts to play bare foot.

## Final Impressions

Not bad for a first prototype. The whole design needs a reworking but I can perform just
as well if not better than on my old foam pads. Some points taken:

* Modular design needs more precision
* USB  power considerations for circuit (typ. 100mA)
* probably should get a safer table saw

A rebuild is definitely in the planning as I'm hoping to create another pad for the
purpose of playing doubles or veruses!

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
c. [Stepmania][4] and [user][3] [packs][5]

[1]: https://github.com/nabulator/openpad "Github Source"
[2]: https://en.wikipedia.org/wiki/Load_cell#Strain_gauge_load_cell "wheatstone bridge"
[3]: http://itgpacks.com
[4]: https://stepmaniax.com
[5]: http://stepmaniaonline.net/

## Footnotes

[^1]: one only needs note its limited availability on second-hand markets, its *still* high price point, its dead-heavy weight, its voluminous spacious body, its 1000W energy hogging power supply, and its additional maintenance costs to reconsider).If you ever try moving a single 100kg pump it up pad up and down a narrow staircase? It has no places to grip and really awkward. 

[^2]: These simfiles are of course, shared pretty much without concern for "digital rights" /s
[^itg]: The StepmaniaX development team has a long and complicated history with DDR when it 
	released ITG in 2005. What's notable about the SMX pads themselves is they feature an 
	additional center arrow, but it's modular design allows for quick swapping.
[^4]: Arcade pads are commonly 'tape-modded' or penny-modded to achieve the same effect.
	It works well but can be prone to fluctuate. 
[^5]: So not quite. But for this project, you would want thick beams and welding. It will
	probably be more expensive. I also
  	know next to nothing about metalworking. 

<!--- vim: set tw=80 -->
