# ===========================================================================
#   http://www.nongnu.org/autoconf-archive/ac_cxx_have_freeze_sstream.html
# ===========================================================================
#
# OBSOLETE MACRO
#
#   Renamed to AX_CXX_HAVE_FREEZE_SSTREAM
#
# SYNOPSIS
#
#   AC_CXX_HAVE_FREEZE_SSTREAM
#
# DESCRIPTION
#
#   Check if the compiler has (need) freeze method call in stringstream/
#   strstream. Seems that Win32 and STLPort have it, libstdc++ not ...
#
#   Eg:
#
#     #include <sstream>
#     #ifdef HAVE_NAMESPACES
#     using namespace std;
#     #endif
#     #ifdef HAVE_SSTREAM
#     stringstream message;
#     #else
#     strstream message;
#     #endif
#     message << "Hello";
#     #ifdef HAVE_FREEZE_SSTREAM
#     message.freeze(0);
#     #endif
#
# LICENSE
#
#   Copyright (c) 2008 Alain BARBET <alian@cpan.org>
#
#   This program is free software; you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the
#   Free Software Foundation; either version 2 of the License, or (at your
#   option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
#   Public License for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program. If not, see <http://www.gnu.org/licenses/>.
#
#   As a special exception, the respective Autoconf Macro's copyright owner
#   gives unlimited permission to copy, distribute and modify the configure
#   scripts that are the output of Autoconf when processing the Macro. You
#   need not follow the terms of the GNU General Public License when using
#   or distributing such scripts, even though portions of the text of the
#   Macro appear in them. The GNU General Public License (GPL) does govern
#   all other use of the material that constitutes the Autoconf Macro.
#
#   This special exception to the GPL applies to versions of the Autoconf
#   Macro released by the Autoconf Archive. When you make and distribute a
#   modified version of the Autoconf Macro, you may extend this special
#   exception to the GPL to apply to your modified version as well.

AU_ALIAS([AC_CXX_HAVE_FREEZE_SSTREAM], [AX_CXX_HAVE_FREEZE_SSTREAM])
AC_DEFUN([AC_CXX_HAVE_FREEZE_SSTREAM],
[AC_CACHE_CHECK(whether the compiler has freeze in stringstream,
ac_cv_cxx_have_freeze_sstream,
[AC_REQUIRE([AC_CXX_NAMESPACES])
  AC_REQUIRE([AC_CXX_HAVE_SSTREAM])
  AC_LANG_SAVE
  AC_LANG_CPLUSPLUS
  AC_TRY_COMPILE([#include <sstream>
#ifdef HAVE_NAMESPACES
using namespace std;
#endif],
[#ifdef HAVE_SSTREAM
stringstream message;
#else
strstream message;
#endif
message << "Hello"; message.freeze(0); return 0;],
  ac_cv_cxx_have_freeze_sstream=yes, ac_cv_cxx_have_freeze_sstream=no)
  AC_LANG_RESTORE
])
if test "$ac_cv_cxx_have_freeze_sstream" = yes; then
   AC_DEFINE(HAVE_FREEZE_SSTREAM,,[define if the compiler has freeze in
stringstream])
fi
])
