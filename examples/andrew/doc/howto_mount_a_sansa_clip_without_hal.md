HOWTO Mount a Sansa Clip without HAL
====================================

Find out what device your Clip shows up as:

    # fdisk -l

Mine shows up as `/dev/sdd`. It's running Netware; I don't know why, but
you shouldn't look to mount individual partitions as you would with a normal
hard drive. Just mount the main block device.

Add this to your `/etc/fstab`:

    /dev/sdd /mnt/sdd vfat rw,nosuid,nodev,uid=1000,shortname=winnt 0 0

Where:

* `/dev/sdd` is the name of your device as shown via `fdisk(8)`.
* `/mnt/sdd` is where you want to mount the device. This can be wherever you
  like, e.g.; `/media/player`, `/mnt/clip`, `~/clip`, etc.
* `vfat` is the type of file system. Stuart Langridge Vfat, that is...
* `rw` allows reading and writing to the device.
* `nosuid` means "Do not allow set-user-identifier or set-group-identifier
  bits to take effect" (from `mount(8)`).
* `nodev` means "Do not interpret character or block special devices on the
  file system" (from `mount(8)`).
* `uid` is the user id that you want to be the owner (yourself, probably). You
  can find this out by running `cat /etc/passwd | grep $USER`, and looking at
  the third field.
* `shortname=winnt` means "blah blah blah"; look at **Mount options for vfat >
  shortname=...** in `mount(8)` if you want to know.
* 0 0 means "... the filesystem does not need to be dumped" and "... the
  filesystem does not need to be checked" (from `fstab(5)`).

EDIT: 2010-05-06
----------------

The above instructions no longer seem to work, at least with Linux 2.6.33.
Revert back to:

    # mount -t vfat /dev/sdd /mnt/sdd

I know, it sucks.
