# Travel Pad

March 2021

A full-sized dance pad can be a bit heavy and unwieldy so why not make a mini
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
	4. [Microcontroller](#Microcontroller)
4. [Final Impressions](#Final-Impressions)
4. [Future Work](#Future-Work)
5. [Appendix](#Appendix)
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

These sensors are pretty robust and not difficult to get something working.
I've seen pads which apply FSRs to a flat surface which "does the job" in terms
of sensing. This article is personal anecdote that reflects what worked best for
me.

## Frame

Being a travel pad means that the frame is smaller and easier to build. I made
mines out of 2x4 pine, which is the cheapest one in my local hardware shop. My
dimensions are just a bit smaller than Rembrandt's but the width of the panel
was designed to be the same width as the 2x4 block. This made constructing the
base very simple. Dowel joinery is used with a jig and base is glued. A full
sized solid 3/4" panel is used as the center. This center was conveniently left
over from the first pad I made. 

![Bare pad with just the center panel](./img/pad2_justbase.jpg)

I used some screw inserts that drill directly into the wood to mount my center
panel. The center panel is countersunk and uses flat head machine screws (#10-24
or M6, whatever is lying around). 

## Sensor Mounts

We need to bring the sensor closer to the surface since my panels are only 3/8"
or ~10mm. Using some plywood and some cheap craft foam did the trick to make
give me arbitrary spacing adjustment. Zetoroux likes the panels to be 3 credit
cards lower than the center, which replicates the kind of feeling you'd get on a
DDR X cabinet [[video]][8]. Flush or raised panels are also possible.

![Sensor mounts](./img/pad2_baseraisers.jpg)

The FSRs have an adhesive on the bottom and tape to these mounts. A small wooden
popsicle-sized stick is placed above the FSR to make sure *only the active
region* is contacted. If your popsicle stick is uneven, or if you make custom
thickness, length wooden contacts, you **must** make sure they make a flat,
uniform contact across the *active region* of the FSR!

## Electronics
Pretty straightforward compared to Load cells due to more robust sensors.

### Sensors 
The sensor form factor I ordered of the
[Interlink Shop][4] is the **FSR Model 408 500mm** length with tab terminators.
The substrate the sensor is printed on is rather thin and bendable. Care is
needed to ensure the two contacts don't short and a proper connector is probably
the best option. Since Interlink failed to send me sensors with the female
terminator (as I had specified in my order), I soldered the damn thing
directly to wires. There's a way to connect cables with electric tape but I
would not recommend it. [^2] 

There are couple of [manufacturer recommendations][7]. But I can give you the
**thick** to **thin**:

- Use a firm and flat mounting surface
- Use a soft rubber or spring to actuate
- Do **NOT** bend, dent or kink

If you use a voltage divider, there are two relationships you get as a result:
- The FSR roughly registers 100kΩ when inactive and 1kΩ when 1kg is actuated
- There is non-linear response which worsens as you increase the resistance

This makes sense as V = R_fsr / R. 

and you're set. 

### Circuit

Unlike the load cells which require an amplifier, using FSRs don't strictly
require an external amplifier. A simple voltage divider is sufficient and used
for each of the four sensors. A resistor value of 330 Ω is used but the exact
value depends on the sensor and setup. 

![A simple voltage divider](./img/pad2_voltage_divider.jpg)

Perfboards are used because I have those lying around and bread boards are
finicky. This way I can mount them upside down on the bottom of my pad. 
JST XH connectors are used for quick disconnects. Still looking for a nice
crimping tool to help me make better connectors. 

![Some BJT switches](./img/pad2_transistors.jpg)
Using some BJT (TIP-121) transistors as switches for the lights. I cut up a 5V
1A LED strip into four slices and those are JST XH terminated as well. They are
externally powered by a different USB connector that is dedicated for power.
These are more useful for debugging pad condition in real time. 

### Microcontroller

Wiring is not great, a hole routes to the bottom of the panel where are the
boards are mounted. 

![Wiring](./img/pad2_wiring.jpg)

Arduino Leonardo, Teejusb's code. Using my own jank DIY cables to connect to the
arduino which have been bolted the bottom of the center panel. Hopefully,
vibration is not an issue.

## Final Impressions

![The final pad](./img/pad2_final.jpg)

It works well for stamina and timing. Maybe I'll upload a video or stream or
something. 

## Future Work
Building a full sized pads with FSRs, using multiple FSRs, maybe custom PCB,
maybe analog MUX, color RGB lights, modifying firmware for saving levels maybe
in the EEPROM or it's own flash code somehow. Acrylic / polycarbonate panels
with art design, a proper bar (welding?)

## Appendix

### Links

a. Sereni's Mechanical FSR Guide on [github][1]
b. Renbrandt's Travel Pad Guide
[google docs][2]
c. Teejusb arduino/teensey firmware on [github][3] 
d. Dom ITG's informational videos playlist on [youtube][5] 
e. greentea's hack on cutting up FSR on [youtube][6] 
e. Good source of FSR for US [shop][4]
f: Jonx on the great DDR X cab [video][8]

[1]: https://github.com/Sereni/fsr-pad-guide
[2]: https://docs.google.com/document/d/1Ho82WgAU57NnZQTG75v4WbRqosCPmwy7r1IAPUC4vxU/
[3]: https://github.com/nabulator/fsr
[4]: https://buyinterlinkelectronics.com/
[5]: https://www.youtube.com/watch?v=Z_x7HFaBBUg&list=PL2vUwLUVuyIy4CD8DEwS7oZ_Y41vyYWW/
[6]: https://www.youtube.com/watch?v=uB9hqS_yGLc
[7]: https://www.digikey.com/en/ptm/i/interlink-electronics/force-sensing-resistors--best-practices/tutorial
[8]: http://nabulator.com/jonx_padthick.mp4

[^1]: I know that electronic piano keyboards have pressure sensitivity detection
       to simulate loudness dynamics of a real piano's hammer action -- through it's
       strangely titled *velocity*. Turns out these keyboards don't have a singular
       sensitivity sensor to acquire this data. Instead, there are two contacts in a
       single key which are placed at different distances from the receiver. Thus,
       the firmware literally measures the velocity of the strike by taking the
       different in time and assigning the Note trigger ON a velocity value based on
       that timing difference. Needless to say, this probably won't give us what
       dance players are looking for, a sharp hysteresis curve. 
[^2]:   I had originally seen a [video][6] which Youtuber greenTea cuts these
        long sensors into several smaller ones. He then shoves two cables and duct
        tapes them into place in a somewhat jank way. I found that this method of
        termination does not guarantee a strong contact between the wire and sensor. In
        other words, the electrical connection is a weak one and prone to
        disconnection. A better way to attach the FSR. 


