In Your VirtualBox, Sorting Out Your VM
=======================================

Linspired from:
`http://forums.virtualbox.org/viewtopic.php?f=1&amp;t=364&amp;start=15`

I had an existing `.vdi` containing an operating system of which,
due to certain [legal restrictions](http://www.microsoft.com/about/legal/useterms/),
I was unable to reinstall a fresh copy. So, here's what I did.

* Get a live CD distro. I don't think it really matters, as long as it has
  [dd](http://www.openbsd.org/cgi-bin/man.cgi?query=dd&amp;sektion=1) and
  support for 'various' filesystems. I used the infamous
  [System Rescue CD](http://www.sysresccd.org/Main_Page), second in notoriety
  only to Shingledecker's [Tiny Core Linux](http://www.tinycorelinux.com/).

* Mount the iso under **CD/DVD-ROM > ISO image file**.

* Create a fresh, dynamically expanding `.vdi` with more room than you think you'll
  need. Mount this image under **Hard Disks > Attachments** as the Primary Slave.

* Fire up your fooked `.vdi`. Hopefully you will have configured things so that you can
  boot from the CD/DVD drive.

* Once you're in, execute

        # fdisk -l

  You should see /dev/sda (fooked) and /dev/sdb (fresh).

... TO BE CONTINUED? ...
