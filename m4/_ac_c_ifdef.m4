# ===========================================================================
#           http://www.nongnu.org/autoconf-archive/_ac_c_ifdef.html
# ===========================================================================
#
# OBSOLETE MACRO
#
#   Renamed to AX_C_IFDEF
#
# SYNOPSIS
#
#   _AC_C_IFDEF(MACRO-NAME, ACTION-IF-DEF, ACTION-IF-NOT-DEF)
#
# DESCRIPTION
#
#   Check for the definition of macro MACRO-NAME using the current
#   language's compiler.
#
# LICENSE
#
#   Copyright (c) 2008 Ludovic Courtes <ludo@chbouib.org>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AU_ALIAS([_AC_C_IFDEF], [AX_C_IFDEF])
AC_DEFUN([_AC_C_IFDEF],
  [AC_COMPILE_IFELSE([#ifndef $1
                      # error "Macro $1 is undefined!"
		      /* For some compilers (eg. SGI's CC), #error is not
		         enough...  */
		      please, do fail
		      #endif],
		     [$2], [$3])])
