# DOTOIFY
_simple tool to pack various things into *.o file_

Want to include some cute picture into your executable but don't want to 
generate megabytes of junk with `xdd -i`? Then __*.o-ify__ is your choise!
Instead of generating .c file it generates .s file, that can be compiled
with `as`! Everyone knows that ASM is superior to C, it's an undeniable
truth! Even through generated files consist of 0% of asm and 100% of labels
and .incbin directives.

## Usage

    dotoify [target] [file] <files...>

If _target_ is __stdout__, output directed into the terminal instead of 
file.

#### Example:

    $ ls -gl
    -rw-r--r-- 1 users 111302 Nov 11 23:02 testpic.bmp
    -rw-r--r-- 1 users  41482 Nov 10 00:09 testpic-2.bmp
    $ ./dotoify incfiles.s testpic.bmp testpic-2.bmp
    $ as -o incfiles.o -c incfiles.s
    $ nm incfiles.o 
    0000a212 D testpic_2_bmp
    000254d8 D testpic_2_bmp_size
    00000000 D testpic_bmp
    0000a20a D testpic_bmp_size

Then you will be able to access those variables from C like this:

    extern char* testpic_bmp;
    extern long long int testpic_bmp_size;
