# robotpkg Makefile for:	path/maneuver-genom3
# Created:			Anthony Mallet on Tue, 13 Dec 2016
#

DISTNAME=		maneuver-genom3-2.1.1
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Simple maneuver planner for aerial robots
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

DEPEND_ABI.libkdtp+=		libkdtp>=1.3
DEPEND_ABI.openrobots2-idl+=	openrobots2-idl>=2.1

include ../../interfaces/openrobots2-idl/depend.mk
include ../../path/libkdtp/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
