Bookmarking for uzbl
====================

I edited the existing `insert_bookmark.sh` for [uzbl](http://uzbl.org)
to make it (hopefully) simpler and remove a dependency on 
[zenity](http://live.gnome.org/Zenity). Check it out:

    #!/bin/bash
    
    # A {replacement,alternative option} for insert_bookmark.sh
    
    [ -d "${XDG_DATA_HOME:-$HOME/.local/share}/uzbl" ] || exit 1
    
    file=${XDG_DATA_HOME:-$HOME/.local/share}/uzbl/bookmarks
    entry=`echo "$6 $7\t" | dmenu -b -l`
    
    if [ $? != 0 ]; then exit "$?"; fi
    
    (echo -e "$entry" && cat $file) | sort -u > $file.$$ && mv $file.$$ $file
    
    true

Clone the 'repo' :) with the following command:

    hg clone http://hg.thelloyd.net/uib

It's kind of a mash up between Lorenzo's [surf](http://surf.suckless.org)
solution and the one included with uzbl. Feedback would be cool.
