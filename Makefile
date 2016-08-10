# Makefile for semantic analysis pass

# Path to top level of LLVM hierarchy
LEVEL = ../../../

# Name of the library to build
LIBRARYNAME = proj1

# Making the shared library become a loadable module so the tools can
# dlopen/dlsym on the resulting library.
LOADABLE_MODULE = 1

LIB_EXT = .dylib

pass1 = $(LEVEL)../bin/opt -load $(LEVEL)../lib/$(LIBRARYNAME)$(LIB_EXT) -proj1 <
pass2 = $(LEVEL)../bin/opt -load $(LEVEL)../lib/$(LIBRARYNAME)$(LIB_EXT) -proj1b <

include $(LEVEL)/Makefile.common
# opt -load ../../../../lib/proj1.dylib -proj1 ~/compiler/llvm/cs565/tests/linked.bc
warning:
	$(pass1) ~/compiler/llvm/cs565/tests/warning.bc > /dev/null
type_mismatch:
	$(pass1) ~/compiler/llvm/cs565/tests/type_mismatch.bc > /dev/null
type_mismatch2:
	$(pass1) ~/compiler/llvm/cs565/tests/type_mismatch2.bc > /dev/null
param_arg_number:
	$(pass1) ~/compiler/llvm/cs565/tests/param_arg_number.bc > /dev/null
invocation_count:
	$(pass2) ~/compiler/llvm/cs565/tests/invocation_count.bc > /dev/null
