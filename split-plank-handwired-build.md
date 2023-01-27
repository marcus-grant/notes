---
created: 2022-11-16T14:29:34.143Z
modified: 2022-11-16T14:29:34.143Z
author: Luke Miller
source: 'https://www.lukemillermakes.com/2021/10/build-a-split-planck-keyboard/'
tags: [keyboard,mechanical,hardware,build,diy]
---
# Build a split planck keyboard

October 10, 2021 

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/th_IMG_20211003_165002.jpg)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/th_IMG_20211003_165002.jpg)

This is my favorite keyboard. It’s comfortable, fast, and efficient. Make one!

Materials
---------

*   1 Arduino pro micro
*   1 nice micro usb cord
*   48 switches (your choice)
*   48 diodes (1N4148 or similar)
*   48 keycaps (I like DSA profile)
*   2 ft of old ethernet cable
*   Some wire (18 AWG to 28 AWG is fine; copper is better)
*   Paracord or cable wrap (some way to keep wires from RH to LH neat and nice)
*   3 zip ties
*   Printed parts: 1 LH, 1 RH, test plate [CAD files](https://www.lukemillermakes.com/wp-content/uploads/2021/10/split-planck-fillet.zip), [source](https://www.lukemillermakes.com/wp-content/uploads/2021/10/kb-case.scad)
*   Firmware: [split-planck-firmware](https://www.lukemillermakes.com/wp-content/uploads/2021/10/split-planck-firmware.zip)

Procedure
---------

### Test switch fit

Print test plate and check switch fit.

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/ae7e62f81d00e71dd4b7efe480e051b3.png)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/ae7e62f81d00e71dd4b7efe480e051b3.png)

The switches should snap in from the flat side (printer bed side). The fit should be snug: neither loose nor too tight to click in easily.

Adjust printer settings (better), or change the parameters in the scad file until you have a good fit (lose post-processed chamfers). I usually make it a little tight and trim with a knife later.

Print LH & RH
-------------

When you have the right printer settings to fit the switch, print the RH and LH.

Snap in switches
----------------

Make sure they are oriented the same direction.

Solder diodes
-------------

This keyboard uses diodes to go across the rows. They should be oriented to go down and right:

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/kb_rows.jpg)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/kb_rows.jpg)

Solder columns
--------------

Cut a section of wire a little longer than the column, use a marker to mark where they need to be stripped, then strip a section in the middle. Solder the columns together.

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/kb_column.jpg)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/kb_column.jpg)

Solder RH & LH
--------------

The rows from the right hand need to carry over to the LH (where the microcontroller will live). Each row should have continuity aleng the bottom of the diode chain.

The columns also need to carry over from the RH to the LH.

Solder microcontroller
----------------------

The included firmware here expects this layout:

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/laptop-kb-planck-pinout.png)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/laptop-kb-planck-pinout.png)

This is what it actually looks like:

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/r_IMG_20211010_132125.jpg)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/r_IMG_20211010_132125.jpg)

The rows go to pins a3 – a0. Then the columns go the rest of the way around.

Flash firmware
--------------

In the zip bundle, the .hex file is the kb firmware.

Command to flash from linux is:

    sudo avrdude -p atmega32u4 -P /dev/ttyACM* -c avr109 -U flash:w:laptopplanck.hex

Get that ready to go, then reset the pro micro by bridging the ‘RST’ and ‘GND’ pins. Press enter and flash the firmware.

Type
----

The base layer is this:

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/planck-base0.png)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/planck-base0.png)

The next layer is accessed from the MO(1) key:

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/planck-layer1.png)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/planck-layer1.png)

The next layer is accessed from the MO(2) key:

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/planck-layer-2.png)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/planck-layer-2.png)

Finally, the numpad (and screenshot) layer, accessed from the MO(3) key:

[![](https://www.lukemillermakes.com/wp-content/uploads/2021/10/planck-layer3.png)](https://www.lukemillermakes.com/wp-content/uploads/2021/10/planck-layer3.png)

Can re-arrange or remap at [https://kbfirmware.com/](https://kbfirmware.com/) by uploading the `laptopplanck.json` file from within the firmware bundle.

  [3d printing](https://www.lukemillermakes.com/category/3d-printing/), [how-to](https://www.lukemillermakes.com/category/how-to/), [making](https://www.lukemillermakes.com/category/making/)  [arduino](https://www.lukemillermakes.com/tag/arduino/), [diy](https://www.lukemillermakes.com/tag/diy/), [keyboard](https://www.lukemillermakes.com/tag/keyboard/), [making](https://www.lukemillermakes.com/tag/making/), [mechanical](https://www.lukemillermakes.com/tag/mechanical/)

3 comments on “Build a split planck keyboard”
---------------------------------------------

*   ![](https://secure.gravatar.com/avatar/9142856922f07521d7d249a02b62cecb?s=60&d=identicon&r=g) Nathan Miller says:
    
    [December 9, 2021 at 12:13 pm](https://www.lukemillermakes.com/2021/10/build-a-split-planck-keyboard/#comment-96)
    
    I’m not sure how to include photos in a comment here, but thanks for the write-up; I built one, and it’s amazing. I had been using it for a few weeks when a firmware flash killed my microcontroller and I had to go back to staggered (gross). Nothing was in the right place, there were way too many keys (more than double what I needed), and I had to reach my fingers for miles just to press common keys like ESC, F-keys, DLT, HME, and END.
    
    I originally built one because I was experiencing wrist pain on my staggered mechanical keyboard (Keychron C2), and the split keyboard, combined with the planck/ortholinear layout have helped tremendously. Needless to say, I’m hooked and am currently building my second one.
    
    [Reply](https://www.lukemillermakes.com/2021/10/build-a-split-planck-keyboard/?replytocom=96#respond)
    
    *   ![](https://secure.gravatar.com/avatar/9142856922f07521d7d249a02b62cecb?s=60&d=identicon&r=g) Nathan Miller says:
        
        [December 9, 2021 at 12:27 pm](https://www.lukemillermakes.com/2021/10/build-a-split-planck-keyboard/#comment-97)
        
        One modification I recently made was to the key layout. I realized that I never use my left thumb for the space button, and have also never seen any person’s keyboard with a symmetrical wear mark on the space bar; it’s always been more worn from the right thumb only. So I rebuilt the firmware, replacing the left-hand SPACE key with SFT\_T(SPACE). This way I can still use the button as a space key if I press it, but now I can also use it as a thumb-activated shift key when I hold it down.
        
        Some other changes I’ve made include remapping the right-hand SPACE to CTL\_T(SPACE), and ENTER to SFT\_T(ENTER). These modifications come after over a month of using the keyboard, so they’re taking some getting used to, but my favorite one is having a mod-tap ctrl/space for my right thumb. As I type in Dvorak, ‘c’, ‘v’, & ‘z’ are all in my right hand, which meant that anytime I wanted to do quick copying/pasting/undoing, I had to have both hands on the keyboard. Now I can do it all with one hand. Silly? Maybe. Convenient? Most definitely.
        
        [Reply](https://www.lukemillermakes.com/2021/10/build-a-split-planck-keyboard/?replytocom=97#respond)
        
*   ![](https://secure.gravatar.com/avatar/?s=60&d=identicon&r=g) a luke imposter says:
    
    [April 14, 2022 at 10:35 pm](https://www.lukemillermakes.com/2021/10/build-a-split-planck-keyboard/#comment-102)
    
    Nice I like how this one has a parts list. You should put a parts list for the pi laptop.
    
    [Reply](https://www.lukemillermakes.com/2021/10/build-a-split-planck-keyboard/?replytocom=102#respond)
    


Categories
----------

*   [3d printing](https://www.lukemillermakes.com/category/3d-printing/)
*   [business](https://www.lukemillermakes.com/category/business/)
*   [carving](https://www.lukemillermakes.com/category/carving/)
*   [comic](https://www.lukemillermakes.com/category/comic/)
*   [Culture](https://www.lukemillermakes.com/category/culture/)
*   [Data Science](https://www.lukemillermakes.com/category/data-science/)
*   [devops](https://www.lukemillermakes.com/category/tech/devops/)
*   [flash fiction](https://www.lukemillermakes.com/category/story/flash-fiction/)
*   [fountain pen](https://www.lukemillermakes.com/category/fountain-pen/)
*   [how-to](https://www.lukemillermakes.com/category/how-to/)
*   [knife](https://www.lukemillermakes.com/category/knife/)
*   [linux](https://www.lukemillermakes.com/category/linux/)
*   [Literature](https://www.lukemillermakes.com/category/literature/)
*   [making](https://www.lukemillermakes.com/category/making/)
*   [metalworking](https://www.lukemillermakes.com/category/metalworking/)
*   [server](https://www.lukemillermakes.com/category/server/)
*   [story](https://www.lukemillermakes.com/category/story/)
*   [tech](https://www.lukemillermakes.com/category/tech/)
*   [Uncategorized](https://www.lukemillermakes.com/category/uncategorized/)
*   [woodworking](https://www.lukemillermakes.com/category/woodworking/)
*   [writing](https://www.lukemillermakes.com/category/writing/)

Meta
----

*   [Log in](https://www.lukemillermakes.com/wp-login.php)
*   [Entries feed](https://www.lukemillermakes.com/feed/)
*   [Comments feed](https://www.lukemillermakes.com/comments/feed/)
*   [WordPress.org](https://wordpress.org/)
