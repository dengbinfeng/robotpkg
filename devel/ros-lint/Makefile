# robotpkg Makefile for:	devel/ros-link
# Created:			Anthony Mallet on Wed, 13 Aug 2014
#

PKGREVISION=	1
ROS_PKG=	roslint
ROS_VERSION=	0.11.2

PKGNAME=	ros-lint-${ROS_VERSION}

CATEGORIES=	devel
ROS_COMMENT=	CMake lint commands
HOMEPAGE=	http://www.ros.org/wiki/roslint

include ../../meta-pkgs/ros-base/Makefile.common

PYTHON_PLIST_COMPILE_PATTERN=/lib[\/].*[.]py$$/

include ../../devel/ros-catkin/depend.mk
include ../../mk/robotpkg.mk
