OPENBSD USER KERNEL CONFIG
==========================

_an [i2c](http://en.wikipedia.org/wiki/I2c) issue on i386_

    boot> -c
    ...
    ukc> disable iic
    ukc> quit

Then, once you're in:

    # config -e -o /bsd.new /bsd
    ...
    ukc> disable iic
    ukc> quit
    ...
    # mv /bsd /bsd.orig
    # mv /bsd.new /bsd
    # reboot

Happy days.

References
----------
* [FAQ: Kernel configuration](http://www.openbsd.org/faq/faq5.html#config)
* [man config(8)](http://www.openbsd.org/cgi-bin/man.cgi?config)
