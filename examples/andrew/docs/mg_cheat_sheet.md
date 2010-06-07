MG CHEAT SHEET
==============

Movement
--------

	C-n: move cursor down   ([N]ext line)      <Up arrow>
	C-p: move cursor up     ([P]revious line)  <Down arrow>
	C-b: move cursor left   ([B]ackwards)      <Left arrow>
	C-f: move cursor right  ([F]orward)        <Right arrow>

	M-b: move backwards one word
	M-f: move forward one word

	C-l: refresh the screen, center on the current line

	C-a: move cursor to beginning of the line  <Home>
	C-e: move cursor to end of the line        <End>

	C-v: page down                             <Page Down>
	M-v: page up                               <Page Up>

	M-<: move cursor to beginning of the file
	M->: move cursor to end of the file

Execute a Command Multiple Times
--------------------------------

	C-u <number> <command>: execute <command> <number> times

For example,

	C-u 5 C-f

moves the cursor forward five characters.

Cancelling Commands
-------------------

	C-g: cancel command immediately (similar to Esc in vi) [Get out of trouble!]

Windows
-------

	C-x 2: split the screen into two windows
	C-x o: move from one window to the other
	C-x 1: restore back to one window

Inserting/Deleting Text
-----------------------

	Backspace:   delete backwards one character at a time
	M-Backspace: delete backwards one word at a time
	C-d:         delete forward one character at a time  <Delete>
	M-d:         delete forward one word at a time       <Alt-Delete>

	C-k: delete line   ([K]ill)  [like cut]
	C-y: restore line  ([Y]ank)  [like paste]

	C-_: undo

Search
------

	C-s <text>: search
	C-s:        find next instance of initial search
	C-r <text>: search backwards  ([R]everse)
	C-r:        find previous instance of initial search

	C-s C-s or C-r C-r: repeat previous search

Use the cursor keys or `C-g` to stop the search operation. If the search term
can't be found, below the status line will read `Failing I-search`. Typing `C-s`
again wraps the search to the top.

Replace
-------

	M-% <search> <replace>

then,

* `y` - replace this instance and search for next
* `n` - skip this instance and search for next
* `.` - stop replacing text (can also use `C-g` or `Enter`)
* `!` - replace all instances without prompting

Remember to start the replace operation at the top of the file.

Cut/Copy/Paste
--------------

	C-k: cut line
	C-y: paste the previously cut line

	C-Space: mark the start of cut/copy region
	C-w:     cut at the end of the region
	M-w:     copy the region

For example,

* Move the cursor to the starting point of the text you want to cut
* Type `C-Space` to mark this as the starting point
* Move the cursor to the end point of the region
* Type `C-w` to cut the region or `M-w` to copy it
* Move the cursor to the position you'd like to paste the cut or copied region
* Type `C-y` to paste it

Status Line
-----------

	**: file has been edited and not saved
	%%: file is read only
	Mg: <filename>: The file being edited is <filename>

	(<editing mode>): current editing mode, for example (fundamental) or (c-mode)

	L<number>: line number cursor is on
	C<number>: column number cursor is on

Opening and Saving Files
------------------------

	C-x C-f: open a file [don't confuse with C-x f: set-fill-command]
	C-x C-s: save the file

Backups have a tilde (`~`) at the end.

Buffers
-------

	C-x C-b: list all buffers
	C-x b:   toggle back and forth between two buffers
	C-x k:   kill selected buffer

Exiting `mg`
------------

	C-z:     exit mg temporarily and return to the shell; type fg to return
	C-x C-c: exit mg permanently

References
----------

* `mg(1)`
* `mg` tutorial at
  <http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/mg/tutorial?rev=1.5>
