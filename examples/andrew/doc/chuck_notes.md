ChucK Notes
===========

ChucK : Strongly-timed, Concurrent, and On-the-fly
Audio Programming Language

Links
-----

* [ChucK wiKi](http://wiki.cs.princeton.edu/index.php/ChucK)
* [miniAudicle wiKi](http://wiki.cs.princeton.edu/index.php/MiniAudicle)

- - -

from the ChucK Manual

``` = unimplemented


Chapter 5 - Types, Values and Variables
---------------------------------------

### Primitive types

* int: integer (signed)
* float: floating point number (in Chuck, a float is by default double-precision)
* time: ChucKian time
* dur: ChucKian duration
* void: (no type)
* same ```

**Values (literals)**

examples:

* int: 42
* int (hexadecimal): 0xaf30
* float: 1.323
* dur: 5.5::second

**Variables**

Variables must be declared before they can be used.

    // declare an 'int' called 'foo'
    int foo;

Assign a value to an existing variable with the ChucK operator (`=>`).

    // assign value of 2 to 'foo'
    2 => foo;

It's possible to combine the above two statements:

    // assign 2 to a new variable 'foo' of type 'int'
    2 => int foo;

To use a variable, refer to it by name:

    // debug-print the value of foo
    <<< foo >>>;

To update the value of foo:

    // multiply 'foo' by 10, assign back to 'foo'
    foo * 10 => foo;

    // or you can use a *=> (mult-chuck)
    10 *=> foo;

Duration example:

    // assign value of '5 seconds' to new variable bar
    5::second => dur bar;

Once you have bar, you can inductively use it to construct new durations:

    // make a measure consist of 4 bars
    4::bar => dur measure;

**Reference types:** types which inherit from the object class (wtf? -A)

(I have no idea what these are. -A)

* Object: base type from which all classes inherit (directly or indirectly)
* Event: fundamental, extendable synchronization mechanism (again, wtf? -A)
* UGen: extendable unit generator base class
* array: N-dimensional ordered set of data (of the same type)
* string: string (of characters)

**Complex types**

(I don't understand complex numbers; look it up. -A)


Chapter 6 - Arrays
------------------

`<<< placeholder >>>`


Chapter 8 - Control Structures
------------------------------

* if
* else
* while
* until
* for
* repeat
* break
* continue
* return
* switch ```


### class keywords

* class
* extends
* public
* static
* pure
* this
* super ```
* interface ```
* implements ```
* protected ```
* private ```


### other chuck keywords

* function
* fun
* spork
* const
* new


### special


#### values

* now
* true
* false
* maybe
* null
* NULL
* me
* pi


#### default durations

* samp
* ms
* second
* minute
* hour
* day
* week


#### global ugens

* dac
* adc
* blackhole


### operators

* `+`
* `-`
* `*`
* `/`
* `%`
* `=>`
* `=<`
* `!=>`
* `||`
* `&&`
* `==`
* `^`
* `&`
* `|`
* `~`
* `::`
* `++`
* `--`
* `>`
* `>=`
* `<`
* `<=`
* `@=>`
* `+=>`
* `-=>`
* `*=>`
* `/=>`
* `%=>`
