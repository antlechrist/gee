Conversation with Anselm R. Garbe of suckless.org
=================================================
Aug 6, 2009

Primus inter pares of the radical simplicity mongers at suckless.org , Anselm
R. Garbe, 29, got his first computer at age 11 when the Wall fell and allowed
PC's into his native German Democratic Republic. He now lives in Guildford, UK
and works for a mobile software company, mainly doing C/C++ development. We
chatted about simplicity in software development. Don't miss Anselm's list of
principles of simplicity at the end of the present article!

** jw: **
Are you "Mr. Suckless" or is it really a consortium of like-minded
individuals?

** arg: **
I think it's more about like-minded individuals inspiring and learning from
each other.

** jw: **
You registered the domain name?

** arg: **
Yup. Some people like uriel find the domain name lame, which it is in some
respects, but on the other hand it contains a clear message.

** jw: **
How long have you been programming?

** arg: **
At the age of 13 or so I wanted to know how computer programs are created and
learned Pascal.

** jw: **
Which Pascal did you use? Turbo ?

** arg: **
Yes, TP5 by that time, but I didn't stay with it very long. Sometime in 93 I
switched to C/C++, particularly focussing UI development on win16/32. My first
Slackware distro, which is the only remaining CDROM software I've kept over
all that time, is dated 1994. I kept going with win NT 3.51, later 4.0 and
OS/2 as well.

** jw: **
Some people never latch onto simplicity, not in music, not in writing, not in
programming. How did you latch onto simplicity?

** arg: **
I realized that very late. I was quite feature driven until my first open
source creation called wmi. I liked OO, C++, XML and all that stuff and never
realized how contrary it was to simple software design. I think it's just the
last 5 years I more and more concluded that simplicity is power.

** jw: **
What sort of experiences pushed you to that conclusion?

** arg: **
If you start a new software project and it isn't usable from nearly day one,
something is wrong. I realized that most software projects I did before that
time never became usable before spending weeks or months on efforts and I
looked for reasons. One reason was OO, which forces people to spend long
period of times with design, and the designed class structure isn't working
initially, and revised during the implementation again and again, because one
didn't think of certain corner cases carefully enough.

I did all the same mistakes as any other programmer and I remembered the time
when I was young and got simple programs running in a matter of hours and
wondered why. Perhaps it was that phase in the evolution of a programmer where
he or she says "great class design and the use of great new modern technology
makes a great product".

And there are those who are proud of "how many lines of code have you written
in your life?"--I remember one student I studied with who responded to that
question "Over 100,000 lines" when asked in one program, which was a Java
program, and he was proud of it.

It was that high complexity challenge, understanding something that can't be
understood completely. Later on, I think when I started with wmii, my
colleages were surprised that it's possible to write something useful with
very few effort, and still using a low-level language like C. They were
usually Java evangelists who thought that something usable but simple can only
be created on top of a full-featured SDK, one that provides all data
structures and algorithms mankind came up with so far, simply because doing it
on your own would make it more complex.

But this is simply wrong! Imagine the simple list paradigm in a C struct,
that's much simpler than using a List implementation from the JDK.

** jw: **
Can all programming needs be addressed that simply? For instance, what happens
to you at work on the mobile devices when you strive for simplicity?

** arg: **
It helps me a lot, because mobiles are usually quite limited compared to
desktop computers, less memory, slower cpu, less data space. Nowadays mobiles
might be faster than a usual Pentium 2 desktop, but still, the same principle
has always been true. The hardware has so much evolved during the last 20
years, but the software is still as slow as 20 years ago, why is that?

The same can be observed on mobiles, the software is becoming more complex,
more layers on top of other layers and the overall user experience is the
responsiveness of a mobile 15 years ago.

** jw: **
What drives the complexity?

** arg: **
I think complexity is driven by two things, perhaps even three nowadays.

First is legacy--the aim to support old stuff that nearly no one uses anymore
(MS has suffered from this all along).

Second the tendency to new technologies. Fifteen years ago the world switched
to OO, ten years ago to XML and SOAP, nowadays to JavaScript. Usually these
new technologies are build on top of older technologies, every five to ten
years another layer appears on top of it.

Perhaps the third reason is marketing, many of these technologies are
advertised and decision makers who usually have no clue about the technology,
who think that, because it's new, it's a new business opportunity. An example
is the heavy switch to Java, which I believe is the Cobol of the future.

** jw: **
You are a particularly vocal exponent of the suckless philosophy... How did
you become so vocal about what you believe?

** arg: **
I think I became so vocal, because I believe that a lot went wrong in the IT
industry recently and I hope to be recognised in order to rethink the common
practice, and perhaps to think about the time when Moore's law stops being a
valid assumption.

At least then, our approach will succeed. I mean that the software we are
developing in the context of suckless.org becomes faster from year to year,
simply because Moore's law is still valid.

I have developed some principles over time. Let me try to summarise them:

1.  Apply the Unix philosophy whenever possible--do only one thing, and do it
    well.
2.  If you design a user interface, make each function only accessible using
    one interaction approach (don't confuse users with doing the same in different
    ways).
3.  Whenever you add a feature, try to remove two features.
4.  Keep track of your lines of code; the more lines you end up with, the
    more likely your software is complex, contains bugs, and isn't simple.
5.  Never do big changes to your software, always use the evolutionary
    approach and take a lot of time to think about what you are going to change.
6.  Only use the revolutionary approach if your existing software is too
    complex to be fixed and needs to be dropped into the [trash, rubbish] bin, but
    even then, use the evolutionary approach.
7.  If your software isn't usable from day one, your design is broken.
8.  Data structures are more important than the actual code.
9.  Always use the simplest data structure, even if you think the
    performance will suffer. If performance is an issue, address it later using
    the evolutionary approach.
10. Citing Ken Thompson: if in doubt, use the brute force approach.
11. Never implement or design "future extensions".
12. Use the simplest programming language \(C).
13. Avoid OO whenever possible. Contrary to common belief, most problems are
    better solved in non-OO ways.
14. Rewrite from scratch instead of trying to fix.
