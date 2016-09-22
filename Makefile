P=fiver
FLAGS=-Wall -O3
DEBUG_FLAGS=-g -Wall -Wextra -Werror -Warray-temporaries -Wconversion -fcheck=all -fmax-errors=1 -fimplicit-none -fbacktrace -ffree-line-length-0 -ffpe-trap=zero,overflow,underflow -finit-real=nan
INCLUDES=assertion.f90 defs.f90 init.f90 bitboards.f90

all:
	gfortran $(FLAGS) -o $(P).out $(INCLUDES) main.f90

debug:
	gfortran $(DEBUG_FLAGS) -o $(P).out $(INCLUDES) main.f90

