# ===========================================================================
#     http://www.nongnu.org/autoconf-archive/ac_cxx_new_for_scoping.html
# ===========================================================================
#
# OBSOLETE MACRO
#
#   Renamed to AX_CXX_NEW_FOR_SCOPING
#
# SYNOPSIS
#
#   AC_CXX_NEW_FOR_SCOPING
#
# DESCRIPTION
#
#   If the compiler accepts the new for scoping rules (the scope of a
#   variable declared inside the parentheses is restricted to the for-body),
#   define HAVE_NEW_FOR_SCOPING.
#
# LICENSE
#
#   Copyright (c) 2008 Todd Veldhuizen
#   Copyright (c) 2008 Luc Maisonobe <luc@spaceroots.org>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AU_ALIAS([AC_CXX_NEW_FOR_SCOPING], [AX_CXX_NEW_FOR_SCOPING])
AC_DEFUN([AC_CXX_NEW_FOR_SCOPING],
[AC_CACHE_CHECK(whether the compiler accepts the new for scoping rules,
ac_cv_cxx_new_for_scoping,
[AC_LANG_SAVE
 AC_LANG_CPLUSPLUS
 AC_TRY_COMPILE(,[
  int z = 0;
  for (int i = 0; i < 10; ++i)
    z = z + i;
  for (int i = 0; i < 10; ++i)
    z = z - i;
  return z;],
 ac_cv_cxx_new_for_scoping=yes, ac_cv_cxx_new_for_scoping=no)
 AC_LANG_RESTORE
])
if test "$ac_cv_cxx_new_for_scoping" = yes; then
  AC_DEFINE(HAVE_NEW_FOR_SCOPING,,[define if the compiler accepts the new for scoping rules])
fi
])
