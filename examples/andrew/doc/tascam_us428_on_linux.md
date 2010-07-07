Tascam US-428 on Linux
======================

* Install `alsa-firmware`:

        # pacman -S alsa-firmware

* Get `alsa-tools`:

        $ wget ftp://ftp.alsa-project.org/pub/tools/alsa-tools-1.0.22.tar.bz2

* Install `usx2yloader`:

        $ tar xvf alsa-tools-1.0.22.tar.bz2
        $ cd alsa-tools-1.0.22/usx2yloader
        $ ./configure --help
        $ ./configure --prefix=/usr
        $ make
        $ sudo make install

* Install `us428control`:

        $ cd ../us428control
        $ ./configure --help
        $ ./configure --prefix=/usr
        $ make
        $ sudo make install

* Install [`fxload`](http://aur.archlinux.org/packages.php?ID=2897) from AUR.

* Install [`udev-tascam-usx2y`](http://aur.archlinux.org/packages.php?ID=14648) from AUR.

* Check the udev rules,

        # vi /etc/udev/rules.d/55-tascam-usx2y.rules

  and edit accordingly. (In my case, I removed the '-m mixxx' entry).

* Turn it on and check your logs:

        # tail -f /var/log/everything.log

  Hopefully everything should be gravy. Check also:

        $ lsusb

  and make sure the Tascam **doesn't** say `w/o firmware` or something similar.
  If you _do_ see something like this, retrace your steps (especially usx2yloader).

* Proceed with the rocking outage.

References
----------

* [udev rules](http://www.ctaf.free.fr/dokuwiki/doku.php?id=archlinux#us428)
* [alsa page on usx2y](http://www.alsa-project.org/main/index.php/Matrix:Module-usb-usx2y)
