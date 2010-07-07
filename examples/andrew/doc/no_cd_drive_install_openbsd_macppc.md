No CD drive? Install OpenBSD macppc
===================================

* Get a Powerbook G4 with a broken internal CD drive.

* Burn the macppc `cd47.iso` to a cdrom.

* Plug an external CD drive into the USB port.

* Power on the machine and press `Command+Option+o+f` to boot into
  Open Firmware.

* At the prompt, boot from the external CD drive, such as:
  
        0 > boot usb0/disk:2,ofwboot /4.7/macppc/bsd.rd

* where **usb0** is your USB device (the port on the back closest to the
  power cord on mine, at least.) **disk:2** is the location of `/`; 
  **disk:1** is the Apple\_partition\_map. **ofwboot /bsd.rd** is the path
  to the ramdisk.

* If all goes well, type `i` at the prompt, and you're on your way.

Note: Debian kind of fooked my machine... but, this thing is *very,
very* old (2001), so problems are to be expected.

**for Debian**

    0 > boot usb0/disk:2,\install\yaboot
