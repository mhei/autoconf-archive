# ===========================================================================
#   http://www.nongnu.org/autoconf-archive/ac_cxx_header_unordered_set.html
# ===========================================================================
#
# OBSOLETE MACRO
#
#   Renamed to AX_CXX_HEADER_UNORDERED_SET
#
# SYNOPSIS
#
#   AC_CXX_HEADER_UNORDERED_SET
#
# DESCRIPTION
#
#   Check whether the C++ include <unordered_set> exists and define
#   HAVE_UNORDERED_SET if it does.
#
# LICENSE
#
#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AU_ALIAS([AC_CXX_HEADER_UNORDERED_SET], [AX_CXX_HEADER_UNORDERED_SET])
AC_DEFUN([AC_CXX_HEADER_UNORDERED_SET], [
  AC_CACHE_CHECK(for unordered_set,
  ac_cv_cxx_unordered_set,
  [AC_REQUIRE([AC_COMPILE_STDCXX_0X])
  AC_LANG_SAVE
  AC_LANG_CPLUSPLUS
  ac_save_CXXFLAGS="$CXXFLAGS"
  CXXFLAGS="$CXXFLAGS -std=gnu++0x"
  AC_TRY_COMPILE([#include <unordered_set>], [using std::unordered_set;],
  ac_cv_cxx_unordered_set=yes, ac_cv_cxx_unordered_set=no)
  CXXFLAGS="$ac_save_CXXFLAGS"
  AC_LANG_RESTORE
  ])
  if test "$ac_cv_cxx_unordered_set" = yes; then
    AC_DEFINE(HAVE_UNORDERED_SET,,[Define if unordered_set is present. ])
  fi
])
