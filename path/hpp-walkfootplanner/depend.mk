#
# Copyright (c) 2008,2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Wed Sep 17 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPWALKFOOTPLANNER_DEPEND_MK:=${HPPWALKFOOTPLANNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-walkfootplanner
endif

ifeq (+,$(HPPWALKFOOTPLANNER_DEPEND_MK)) # ---------------------------

PREFER.hpp-walkfootplanner?=	robotpkg

DEPEND_USE+=			hpp-walkfootplanner

DEPEND_ABI.hpp-walkfootplanner?=hpp-walkfootplanner>=2.0r1
DEPEND_DIR.hpp-walkfootplanner?=../../path/hpp-walkfootplanner

SYSTEM_SEARCH.hpp-walkfootplanner=\
	include/hpp/walkfootplanner/planner.hh	\
	lib/libhpp-walkfootplanner.la		\
	'lib/pkgconfig/hpp-walkfootplanner.pc:/Version/s/[^0-9]//gp'

endif # HPPWALKFOOTPLANNER_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
