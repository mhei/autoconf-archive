# ================================================================================
#  http://www.nongnu.org/autoconf-archive/ac_cxx_default_template_parameters.html
# ================================================================================
#
# OBSOLETE MACRO
#
#   Renamed to AX_CXX_DEFAULT_TEMPLATE_PARAMETERS
#
# SYNOPSIS
#
#   AC_CXX_DEFAULT_TEMPLATE_PARAMETERS
#
# DESCRIPTION
#
#   If the compiler supports default template parameters, define
#   HAVE_DEFAULT_TEMPLATE_PARAMETERS.
#
# LICENSE
#
#   Copyright (c) 2008 Todd Veldhuizen
#   Copyright (c) 2008 Luc Maisonobe <luc@spaceroots.org>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AU_ALIAS([AC_CXX_DEFAULT_TEMPLATE_PARAMETERS], [AX_CXX_DEFAULT_TEMPLATE_PARAMETERS])
AC_DEFUN([AC_CXX_DEFAULT_TEMPLATE_PARAMETERS],
[AC_CACHE_CHECK(whether the compiler supports default template parameters,
ac_cv_cxx_default_template_parameters,
[AC_LANG_SAVE
 AC_LANG_CPLUSPLUS
 AC_TRY_COMPILE([
template<class T = double, int N = 10> class A {public: int f() {return 0;}};
],[A<float> a; return a.f();],
 ac_cv_cxx_default_template_parameters=yes, ac_cv_cxx_default_template_parameters=no)
 AC_LANG_RESTORE
])
if test "$ac_cv_cxx_default_template_parameters" = yes; then
  AC_DEFINE(HAVE_DEFAULT_TEMPLATE_PARAMETERS,,
            [define if the compiler supports default template parameters])
fi
])
