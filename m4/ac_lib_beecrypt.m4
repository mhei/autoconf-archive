# ===========================================================================
#            http://autoconf-archive.cryp.to/ac_lib_beecrypt.html
# ===========================================================================
#
# SYNOPSIS
#
#   AC_LIB_BEECRYPT([yes|no|auto])
#
# DESCRIPTION
#
#   Searches for the 'beecrypt' library with the --with... option.
#
#   If found, define HAVE_BEECRYPT and macro BEECRYPT_LIBS. Also defines
#   BEECRYPT_WITH_<algo> for the algorithms found available. Possible
#   algorithms: BASE64 AES BF MD5 SHA1 SHA256 SHA384 SHA512.
#
#   The argument is used if no --with...-beecrypt option is set. Value "yes"
#   requires the configuration by default. Value "no" does not require it by
#   default. Value "auto" configures the library only if available.
#
# LAST MODIFICATION
#
#   2008-08-06
#
# COPYLEFT
#
#   Copyright (c) 2008 Fabien Coelho <autoconf.archive@coelho.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

# AC_CHECK_BEECRYPT_ALGO([name],[function])
AC_DEFUN([AC_CHECK_BEECRYPT_ALGO],[
  AC_CHECK_LIB([beecrypt], [$2],
    AC_DEFINE([BEECRYPT_WITH_$1],[1],[Algorithm $1 in beecrypt library]))
])

# AC_LIB_BEECRYPT([yes|no|auto])
AC_DEFUN([AC_LIB_BEECRYPT],[
  AC_MSG_CHECKING([whether beecrypt is enabled])
  AC_ARG_WITH([beecrypt],[  --with-beecrypt         require beecrypt library
  --without-beecrypt      disable beecrypt library],[
    AC_MSG_RESULT([$withval])
    ac_with_beecrypt=$withval
  ],[
    AC_MSG_RESULT([$1])
    ac_with_beecrypt=$1
  ])
  if test "$ac_with_beecrypt" = "yes" -o "$ac_with_beecrypt" = "auto" ; then
    AC_CHECK_HEADERS([beecrypt/beecrypt.h],[
      AC_CHECK_LIB([beecrypt],[blockCipherFind],[
        AC_DEFINE([HAVE_BEECRYPT],[1],[Beecrypt library is available])
	HAVE_BEECRYPT=1
        AC_SUBST([BEECRYPT_LIBS],[-lbeecrypt])
	# encoding
	AC_CHECK_BEECRYPT_ALGO([BASE64],[b64encode])
	# ciphers
        AC_CHECK_BEECRYPT_ALGO([AES],[aesSetup])
        AC_CHECK_BEECRYPT_ALGO([BF],[blowfishSetup])
	# digests
        AC_CHECK_BEECRYPT_ALGO([MD5],[md5Digest])
        AC_CHECK_BEECRYPT_ALGO([SHA1],[sha1Digest])
        AC_CHECK_BEECRYPT_ALGO([SHA256],[sha256Digest])
        AC_CHECK_BEECRYPT_ALGO([SHA384],[sha384Digest])
        AC_CHECK_BEECRYPT_ALGO([SHA512],[sha512Digest])
      ])
    ])
    # complain only if explicitely required
    if test "$ac_with_beecrypt" = "yes" -a "x$HAVE_BEECRYPT" = "x" ; then
        AC_MSG_ERROR([cannot configure required beecrypt library])
    fi
  fi
])
