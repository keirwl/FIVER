all:
	gfortran -Wall -Werror -fmax-errors=1 main.f90 init.f90 defs.f90

debug:
	gfortran -g -Wall -Wextra -Warray-temporaries -Wconversion -fimplicit-none -fbacktrace -ffree-line-length-0 -ffpe-trap=zero,overflow,underflow -finit-real=nan main.f90 init.f90 defs.f90

