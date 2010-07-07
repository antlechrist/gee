Shell Coding Style
==================

* Indent with tabs
* Opening braces are top right, closing braces are bottom left. Example:

        foo() {
                echo bar
        }

* `if` and `for` statements like this:

        if true; then
                do something
        else
                do something else
        fi

        for i in a b c; do
                echo $i
        done

* Use single quotes unless the string contains parseable content, e.g.;

        foo='bar baz boo'
        foo="$bar $baz $boo"

* What about:

        `` vs $();
        source vs .;
        $foo vs ${foo} ?

  * `source` is a bashism. '`.`' is sh, but it's easier to grep for `source`.
    Use `source` when the script is bash and you're pretty sure it will stay
    bash, '`.`' otherwise. `${foo}` should only be used when it's needed.

_from the arch-dev-public mailing list and subsequently 
<http://wiki.archlinux.org/index.php/DeveloperWiki:Bash_Coding_Style>_
