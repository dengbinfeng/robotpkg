#
# Copyright (c) 2007 LAAS/CNRS                        --  Wed May 30 2007
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# From $NetBSD: can-be-built-here.mk,v 1.4 2007/02/10 09:01:05 rillig Exp $
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

#
# This file checks whether a package can be built in the current robotpkg
# environment. It checks the following variables:
#
# PKG_FAIL_REASON, PKG_SKIP_REASON
#

_CBBH_CHECKS=		# none, but see below.

# Check PKG_FAIL_REASON
_CBBH_CHECKS+=		fail
_CBBH_MSGS.fail=	"This package has set PKG_FAIL_REASON:" ${PKG_FAIL_REASON}

_CBBH.fail=		yes
ifdef PKG_FAIL_REASON
ifneq (,${PKG_FAIL_REASON})
_CBBH.fail=		no
endif
endif

# Check PKG_SKIP_REASON
_CBBH_CHECKS+=		skip
_CBBH_MSGS.skip=	"This package has set PKG_SKIP_REASON:" ${PKG_SKIP_REASON}

_CBBH.skip=		yes
ifdef PKG_SKIP_REASON
ifneq (,$(PKG_SKIP_REASON))
_CBBH.skip=		no
endif
endif


# Collect and combine the results
_CBBH=			yes
_CBBH_MSGS=		# none

define _CBBH_mix
  ifneq (yes,${_CBBH.$(1)})
_CBBH=			no
_CBBH_MSGS+=		${_CBBH_MSGS.$(1)}
  endif
endef
$(foreach c,${_CBBH_CHECKS}, $(eval $(call _CBBH_mix,${c})))


# In the first line, this target prints either "yes" or "no", saying
# whether this package can be built. If the package can not be built,
# the reasons are given in the following lines.
#
.PHONY: can-be-built-here _cbbh

can-be-built-here:
	@${ECHO} ${_CBBH}
	@:; $(foreach m,${_CBBH_MSGS},${ECHO} ${m};)

_cbbh:
	@:; $(foreach m,${_CBBH_MSGS},${ERROR_MSG} ${m};)
	@${FALSE}

ifeq (no, ${_CBBH})
# XXX: bootstrap-depends is only used here because it is depended
# upon by each of the "main" pkgsrc targets.
bootstrap-depends: _cbbh
endif
