all:
	gfortran -Wall -Werror -fmax-errors=1 defs.f90 init.f90 main.f90

debug:
	gfortran -g -Wall -Wextra -Werror -Warray-temporaries -Wconversion -fmax-errors=1 -fimplicit-none -fbacktrace -ffree-line-length-0 -ffpe-trap=zero,overflow,underflow -finit-real=nan defs.f90 init.f90 main.f90

