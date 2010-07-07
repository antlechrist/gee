GENOSITE UPDATE
===============

I've made some modification to the scripts. Check it out.

genosite.sh
-----------

    #!/bin/sh
    
    EXT=md
    FMT=markdown
    LC_ALL=en_US.UTF-8
    PATH=/bin:/usr/bin
    PREFIX=/
    URL=andrew.antlechrist.org
    export LC_ALL PATH
    
    menu() {
    	for i in `ls -F $1 | grep -v index.$EXT | sort`
    	do
    		case $i in
    		*.$EXT)
    			base=`echo $i | sed "s/.\$EXT$//"`
    			cleanbase=`echo $base | sed 's/_/ /g'`
    			if test "x$base" = "x$2"
    			then
    				echo "<li class='current'><a href=\"$base.html\">$cleanbase</a></li>"
    			else
    				echo "<li><a href=\"$base.html\">$cleanbase</a></li>"
    			fi
    			cur=1
    			;;
    		*/)
    			echo "<li><a href=\"$i\">$i</a></li>"
    			;;
    		esac
    	done
    	cat <<END
    </ul>
    </div>
    END
    }
    
    page() {
    	mtime=`ls -l $1$2.$EXT | awk '{ print $6" " $7" at " $8 }'`
    	title="$URL`echo $4 | sed 's/.html//'`"
    	cat <<END
    <!doctype html>
    <head>
    <title>$title</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link href="/favicon.png" rel="icon" type="image/png" />
    <link href="/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
    <div id="container">
    <div class="midHeader">
    <div class="headerTitle">$3</a></div>
    </div>
    <div id="menu">
    <ul>
    END
    	menu $1 $2
    cat <<END
    <div id="main-copy">
    END
    	cat $1$2.$EXT | tr -d '\r' | $FMT
    	cat <<END
    </div>
    <div id="footer">
    <div class="left">
    Powered by <a href="http://hg.suckless.org/genosite">genosite</a>,
    <a href="http://www.pell.portland.or.us/~orc/Code/discount/">discount</a>,
    and <a href="http://www.vim.org/">vim</a><br />
    <a href="$2.$EXT">Page source</a>
    </div>
    <div class="right">
    Last modified: $mtime<br />
    <a href="/LICENSE">Copyright 2009-2010 Andrew Antle</a>
    </div>
    </div>
    </div>
    </body>
    </html>
    END
    }

    process() {
    	for i in `ls -F $1`
    	do
    		case $i in
    		*.$EXT)
    			echo processing $1$i
    			base=`echo $i | sed "s/.\$EXT$//"`
    			if test x$base = xindex
    			then
    				title=$3
    			else
    				title=$3$base.html
    			fi
    			page "$1" "$base" "$2" "$title" > "$1$base.html"
    			;;
    		*/)
    			process "$1$i" "$2</a> <a href=\"$PREFIX`echo $1 | \
    			sed 's/.\///'`$i\">$i" $3$i
    			;;
    		*)
    			;;
    		esac
    	done
    }
    
    if test $1
    then
    	cd $1
    fi
    
    find . -type l | xargs rm -f
    
    process "./" "<a href=\"/\">$URL/" /

genosync.sh
-----------

    #!/bin/sh
    
    # file:   ~/bin/genosync.sh
    # author: Andrew Antle - http://antlechrist.org/
    # date:   2010-03-11
    
    RSYNC=/usr/bin/rsync
    SSH=/usr/bin/ssh
    PORT=portnumber
    RUSER=username
    RHOST=example.org
    RPATH=/remotepath/
    LPATH=/localpath/
    
    do_pull() {
    	$RSYNC -avz --delete -e "$SSH -p $PORT" $RUSER@$RHOST:$RPATH $LPATH
    }
    
    do_push() {
    	$RSYNC -avz --delete -e "$SSH -p $PORT" $LPATH $RUSER@$RHOST:$RPATH
    }
    
    case "$1" in
    	-l | --pull)
    		do_pull
    		if [ $? -gt 0 ]; then
    			echo FAILED
    			exit 1
    		else
    			echo SUCCESS
    		fi
    		;;
    	-s | --push)
    		do_push
    		if [ $? -gt 0 ]; then
    			echo FAILED
    			exit 1
    		else
    			echo SUCCESS
    		fi
    		;;
    	*)
    		echo "usage: `basename $0` {-l, --pull|-s, --push}"
    esac
    
    exit 0

Thanks to [Anselm](http://garbe.us/) for this excellent script.
My modifications are released under the same
[license](http://hg.suckless.org/genosite/raw-file/tip/LICENSE)
as genosite itself. Feel free to use them as you see fit.
