EXTRACT SPECIFIC FILES WITH BSDTAR
==================================

	$ bsdtar xf foo.tar.gz bar.txt

Use `bsdtar` to (x) extract archive member `bar.txt` from (f) file `foo.tar.gz`.


	$ bsdtar xf house-of-lloyd_20091224.tar --include=*/mwatdp/*

Extract all files matching the pattern `*/mwatdp/*` from the archive
`house-of-lloyd_20091224.tar`, but no others. Nice for big-ass archives.
