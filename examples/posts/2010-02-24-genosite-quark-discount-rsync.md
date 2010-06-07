GENOSITE, QUARK, DISCOUNT AND RSYNC
===================================

I've been looking for different solutions to my web goings-on, including
[hand coding](http://thelloyd.net/label/), [jekyll](http://jekyllrb.com/),
[hakyll](http://jaspervdj.be/hakyll/), and [werc](http://werc.cat-v.org/) (my
favorite of them all). I've also tried wiki stuff, most notably
[SigWik](http://c2.com/cgi/wiki?SigWik) and [usemod](http://usemod.com/).
I've tried many more as well, but I was unsatisfied. What I'm looking for:

* It has to be [simple](http://suckless.org/manifest/).
* I want to write in [Markdown](http://daringfireball.net/projects/markdown).
  Writing html is annoying.
* No so-called 'vanity' languages. Ruby, Haskell, rc (werc's biggest
  detraction for me; my fault, because I don't know rc.)

Then I started messing around with [genosite](http://hg.suckless.org/genosite),
and I was happy.

I can write pages in my editor, and categorize them via directories. It takes
the donkey-work out of managing the site, like werc, but isn't as collaborative
as werc in terms of real-time editing. But, I don't really care about this.

Then I use [quark](http://hg.suckless.org/quark) on port 8000, like with jekyll
and hakyll, for real-time previewing. It's nice because I can run it in any
directory as a chroot, and all the relative and absolute links work, and
stylesheets are correctly applied.

Another nice thing is that I can use any Markdown implementation I want. My
favorites are [Discount](http://www.pell.portland.or.us/~orc/Code/discount/)
and [smu](http://s01.de/~gottox/index.cgi/proj_smu), both written in C. Once
I'm happy with everything, I can just rsync my local directory to the remote
server. Easy-peasy.

Here are my modifications:

OFFICIAL_GENERATE
-----------------

    #!/bin/sh
    
    # $Id: official_generate,v 1.8 2010/02/24 01:42:08 andrew Exp andrew $
    
    EXT=md
    FMT=markdown
    LC_ALL=en_US.UTF-8
    PATH=/bin:/usr/bin:/usr/local/bin
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
    <link href="/style.css" rel="stylesheet" type="text/css"  />
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
    Powered by <a href="http://hg.suckless.org/genosite">genosite</a><br />
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
                process "$1$i" "$2</a> <a href='$PREFIX$i'>$i" $3$i
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

OFFICIAL_UPDATE
---------------

    #!/bin/sh
    
    # $Id: official_update,v 1.2 2010/02/24 08:39:10 andrew Exp andrew $
    
    RSYNC=/usr/bin/rsync
    SSH=/usr/bin/ssh
    RUSER=user
    RHOST=remoteserver
    RPATH=public_html/
    LPATH=/home/pub/html/
    
    $RSYNC -avz --delete -e "$SSH -p <port>" $LPATH $RUSER@$RHOST:$RPATH

I'm really enjoying it.

References
----------

* [genosite](http://hg.suckless.org/genosite)
* [quark](http://hg.suckless.org/quark)
* [discount](http://www.pell.portland.or.us/~orc/Code/discount/)
* [rsync](http://rsync.samba.org)
