---
date: 2025-04-09 16:04
tags:
  - Linux
category: "[[Linux]]"
---
# C

# Linking 

## Linking a library (.a or .so file)

To link a lib file of name `libexample.a` you include the flag `-lexample` **After** the name of the output file is specified.

The `-L.` flag specifies to search for libraries in the current directory.

You also must include the header file in your c file which contains the function prototypes e.g. 
```c
#include "example.h"
```

# Makefile

Compile commands in makefile are usually structured as following
```bash
${CC} ${CFLAGS} inputfile1.c inputfile2.c -o outputfile.o -L. -lmylib
```

## Setting PHONY targets

Phony targets unlike normal targets aren't named after a output file and are just utility commands.

```makefile

.PHONY: clean

clean:
    #clean command here
```

## Automatic Variables
- `$@` Gets name of rule target
- `$<` Gets first name of first prerequisit
- `$^` Gets all prerequesits
- `$?` Gets all prerequesits **newer than the target**

## Wildcards

`%` is similar to `*` in bash. For example `%.c` means any file ending with `.c` and `f%` means any file starting with `f`

## Example Makefile
 ```make
# Configuration
CC=clang
CFLAGS=-Wall
LDFLAGS=
EXE=example
OBJ=example.o circles.o output.o


# Default target: link the object code into the executable
${EXE}: ${OBJ}
    ${CC} ${LDFLAGS} -o $@ $^


# Compile object code from source code
%.o: %.c
    ${CC} ${CFLAGS} -c $<


# Remove build products
.PHONY: clean
clean:
    rm *.o ${EXE}

 ```

 # GDB

 ## Adding debug to a object file during compilation

 Add the `-g` flag to your `clang` command e.g.

 ```bash
clang -g program.c -o 
 ```

 ## GDB Commands

 ### Invoking GDB

 ```bash
gdb --tui executable
 ```

### Running the program
- Use run use the `run` or `r` command

 ### Progressing the Program

- To run until breakpoint/ watch point use `continue` or `c`
- To run one line use `step` or `s` (note: `step` allows for entering into functions)
- To run one line without entering functions use `next` or `n`

### Stopping a Program
- To end a program's execution use the `kill` or `k` command

## Breakpoints

There are different contexts to use the `break` command:

- `break line_number` breaks at specified line number
- `break function_name` breaks when specified function is called
- `break filename:function_name` breaks when function from a specific file is called
- `info breakpoints` gets info on all breakpoints (including IDs)
- `delete` deletes all breakpoints
- `delete ID` deletes breakpoint with that ID

## Watchpoints
- `watch VARIABLE` make program pause every time `VARIABLE` is updated
- `watch CONDITION` pauses the program when a condition is true e.g. `watch i>12`

## Examining Functions

- `print VARIABLE` shows the value of the variable
- `print &VARIABLE` prints the address of a variable
- `print *VARIABLE` prints the value at the address of a variable
- `print VARIABLE[n]` prints the nth element of an array
- `ptype VARIABLE` prints the datatype of a variable

# Strings
`string.h`

## Useful String Functions
- `strcmp(string1, string2)` - 0 if identical
- `strlen(string1)`
- `strcpy(destination, source)`
- `strcat(string1, string2)` 

## Format String Specifiers
- `%d` or `%i` signed integer
- `%u` unsigned integer
- `%f` float
- `%lf` double
- `%c` character
- `%s` string
- `%hd` signed short int
- `%hu` unsigned short int
- `%hhu` short short unsigned int

# Commmand Line args in C

```c
int main(int argc, char* argv) {
    printf("Hello %s", argv[1]);
}
```

# File operations C
`stdio.h`

## Initalising the file pointer

```c
FILE *fp = fopen("filename.txt", "w")
```

### File Open Modes

- `r` for read mode
- `w` for write mode
- `a` for append mode
- `b` after any of the above to do this in binary mode
- `r+`, `w+` for read and write mode
- `a+` for both reading and appending

## Reading from a file

```c
fscanf(fp, "formatted string %d %d", &var1, &var2);
```

## Writing to a file 

### `fprintf`
```c
fprintf(fp, "formatted string %d %d", &var1, &var2);
```

`fprintf` prints a formated string to a file

### `fwrite`
```c
fwrite(&var, sizeof(var), 1, fp);
```

Writes **only** a variable to a file.

An array can be written to a file using 

```c
int array[100];
int n = sizeof(array)/sizeof(int); //calculates the length of arr
fwrite(&arr, sizeof(int), n, fp);
```


# Reading user input

```c
scanf("%d", &var1);
```
