sizeof long int
===============

Remember:
---------

    #include <limits.h>

AND

    #include <stdio.h>

for `long int`
--------------

long, signed integer; signed means positive to negative i.e.;
100 to -100, not just positive i.e.; 0 - 200.

from: <http://en.wikipedia.org/wiki/Printf>

    printf("%ld to %ld\n", LONG_MAX, LONG_MIN);

<pre><code>
/* sizeof.c on x86_64 */

#include <limits.h>
#include <stdio.h>

int main() {
    printf("short int\t size: %d bytes\t", sizeof(short int));
    printf("%d to %d\n", SHRT_MAX, SHRT_MIN);

    printf("long int\t size: %d bytes\t", sizeof(long int));
    printf("%ld to %ld\n", LONG_MAX, LONG_MIN);

    printf("char\t size: %d byte\n", sizeof(char));
    printf("float\t size: %d bytes\n", sizeof(float));
    printf("double\t size: %d bytes\n", sizeof(double));

    return 0;
}
</code></pre>

    $ ./sizeof
    short int   size: 2 bytes   32767 to -32768
    long int    size: 8 bytes   9223372036854775807 to -9223372036854775808
    char        size: 1 byte
    float       size: 4 bytes
    double      size: 8 bytes
