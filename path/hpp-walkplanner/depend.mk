#
# Copyright (c) 2008 LAAS/CNRS
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
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
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

# Authored by Anthony Mallet on Wed May 14 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_WALKPLANNER_DEPEND_MK:=${HPP_WALKPLANNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-walkplanner
endif

ifeq (+,$(HPP_WALKPLANNER_DEPEND_MK)) # ------------------------------

PREFER.hpp-walkplanner?=	robotpkg

SYSTEM_SEARCH.hpp-walkplanner=\
	include/hppWalkPlanner/hppWalkPlanner.h	\
	lib/libhppWalkPlanner.la

DEPEND_USE+=		hpp-walkplanner

DEPEND_ABI.hpp-walkplanner?=hpp-walkplanner>=1.3.2
DEPEND_DIR.hpp-walkplanner?=../../path/hpp-walkplanner

endif # HPP_WALKPLANNER_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
