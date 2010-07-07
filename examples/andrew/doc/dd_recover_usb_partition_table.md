HOWTO recover a USB stick with a fooked partition table
=======================================================

`o` creates a new DOS partition table on the device.

`w` writes the info and exits.

This will fuck your shit up. But if you are here, your shit is already fairly
fucked up.

    # fdisk /dev/sdc
    # o
    # w
    
    # cfdisk /dev/sdc

Do your thing.
