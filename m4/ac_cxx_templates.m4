# ===========================================================================
#        http://www.nongnu.org/autoconf-archive/ac_cxx_templates.html
# ===========================================================================
#
# OBSOLETE MACRO
#
#   Renamed to AX_CXX_TEMPLATES
#
# SYNOPSIS
#
#   AC_CXX_TEMPLATES
#
# DESCRIPTION
#
#   If the compiler supports basic templates, define HAVE_TEMPLATES.
#
# LICENSE
#
#   Copyright (c) 2008 Todd Veldhuizen
#   Copyright (c) 2008 Luc Maisonobe <luc@spaceroots.org>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AU_ALIAS([AC_CXX_TEMPLATES], [AX_CXX_TEMPLATES])
AC_DEFUN([AC_CXX_TEMPLATES],
[AC_CACHE_CHECK(whether the compiler supports basic templates,
ac_cv_cxx_templates,
[AC_LANG_SAVE
 AC_LANG_CPLUSPLUS
 AC_TRY_COMPILE([template<class T> class A {public:A(){}};
template<class T> void f(const A<T>& ){}],[
A<double> d; A<int> i; f(d); f(i); return 0;],
 ac_cv_cxx_templates=yes, ac_cv_cxx_templates=no)
 AC_LANG_RESTORE
])
if test "$ac_cv_cxx_templates" = yes; then
  AC_DEFINE(HAVE_TEMPLATES,,[define if the compiler supports basic templates])
fi
])
