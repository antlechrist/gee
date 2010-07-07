BSDTAR AND COMPRESSION STATS
============================

    [andrew@lloyd ~]$ time (bsdtar cf docs.tar docs && gzip docs.tar)
    (; bsdtar cf docs.tar docs && gzip docs.tar; )  7.57s user 0.42s system 94% cpu 8.464 total
    [andrew@lloyd ~]$ time (bsdtar cf docs.tar docs && bzip2 docs.tar)    
    (; bsdtar cf docs.tar docs && bzip2 docs.tar; )  38.67s user 0.43s system 99% cpu 39.150 total
    [andrew@lloyd ~]$ time (bsdtar cf docs.tar docs && ba7 docs.tar.7z docs.tar)
    (; bsdtar cf docs.tar docs && ba7 docs.tar.7z docs.tar; )  78.51s user 1.08s system 177% cpu 44.846 total
    [andrew@lloyd ~]$ time (bsdtar cf docs.tar docs && xz docs.tar)             
    (; bsdtar cf docs.tar docs && xz docs.tar; )  73.54s user 0.62s system 99% cpu 1:14.20 total
    [andrew@lloyd ~]$ du -s docs*
    129380  docs
    99044   docs.tar.7z
    104720  docs.tar.bz2
    105264  docs.tar.gz
    99404   docs.tar.xz
    [andrew@lloyd ~]$ du -sh docs*
    127M    docs
    97M     docs.tar.7z
    103M    docs.tar.bz2
    103M    docs.tar.gz
    98M     docs.tar.xz
    [andrew@lloyd ~]$ cat bin/ba7 
    #!/bin/sh
    
    7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $1 $2
