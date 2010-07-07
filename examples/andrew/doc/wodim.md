CLI CD Burning with wodim or cdrecord?
======================================

WODIM `(cdrkit)`
----------------

### Data

    $ wodim dev=/dev/scd0 driveropts=burnfree -v -data foo.iso

### Audio

    $ wodim dev=/dev/scd0 driveropts=burnfree -v -audio 01-foo.wav 02-bar.wav...

CDRECORD `(cdrtools)`
---------------------

### Data

    $ cdrecord dev=/dev/scd0 foo.iso

I recommend `cdrtools`. It seems _much_ more performant and stable;
plus, it burns the data with a very high degree of integrity.
