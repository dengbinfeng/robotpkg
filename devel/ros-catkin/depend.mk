# robotpkg depend.mk for:	sysutils/py-rospkg
# Created:			Anthony Mallet on Sun, 15 Jul 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_CATKIN_DEPEND_MK:=	${ROS_CATKIN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-catkin
endif

ifeq (+,$(ROS_CATKIN_DEPEND_MK)) # -----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
include ../../mk/sysdep/python.mk

PREFER.ros-catkin?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-catkin?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-catkin
ROS_DEPEND_USE+=		ros-catkin

DEPEND_DIR.ros-catkin?=		../../devel/ros-catkin
DEPEND_ABI.ros-catkin?=	${PKGTAG.python-}ros-catkin>=0.7

SYSTEM_SEARCH.ros-catkin=\
	'bin/catkin_init_workspace'				\
	'lib/pkgconfig/catkin.pc:/Version/s/[^0-9.]//gp'	\
	'share/catkin/cmake/catkinConfig.cmake'			\
	'${PYTHON_SYSLIBSEARCH}/catkin/__init__.py'

CMAKE_PREFIX_PATH.ros-catkin=	${PREFIX.ros-catkin}

USE_ROS_CATKIN?=	yes
ifneq (,$(filter yes YES Yes,${USE_ROS_CATKIN}))
  DEPEND_ABI.cmake+= cmake>=2.8.3
  include ../../pkgtools/pkg-config/depend.mk
  include ../../sysutils/py-catkin-pkg/depend.mk
  include ../../mk/sysdep/cmake.mk
  include ../../mk/sysdep/py-empy.mk
  include ../../mk/sysdep/py-nose.mk
  include ../../mk/sysdep/python.mk

  include ../../mk/robotpkg.prefs.mk # for prependpaths

  CMAKE_ARGS+=-DCATKIN_DEVEL_PREFIX=${WRKDIR}/stage
  CMAKE_ARGS+=-DNOSETESTS=${NOSETESTS}
  CMAKE_ARGS+=-DCATKIN_BUILD_BINARY_PACKAGE=1
  CMAKE_ARGS+=-DSETUPTOOLS_DEB_LAYOUT=OFF

  # disable tests by default - googletests started to require C++14 since
  # release 1.13 and handling this complexity is not really worth it for older
  # packages
  CATKIN_ENABLE_TESTING?=	no
  ifneq (,$(filter yes YES Yes,${CATKIN_ENABLE_TESTING}))
    include ../../mk/sysdep/googletest.mk
    CMAKE_ARGS+=-DCATKIN_ENABLE_TESTING=ON
    CMAKE_ARGS+=-DGTEST_ROOT=${PREFIX.googletest}
  else
    CMAKE_ARGS+=-DCATKIN_ENABLE_TESTING=OFF
  endif

  # handle meta pkgs
  ifneq (,$(filter yes YES Yes,${ROS_METAPKG}))
    CONFIGURE_DIRS?=	${WRKSRC}/build
    CMAKE_ARG_PATH?=	..

    pre-configure: catkin-init-workspace
  endif

  .PHONY: catkin-init-workspace
  catkin-init-workspace:
	${RUN}							\
	${MKDIR} ${CONFIGURE_DIRS};				\
	cd ${CONFIGURE_DIRS} && cd ${CMAKE_ARG_PATH};		\
	${TEST} ! -h CMakeLists.txt || ${RM} CMakeLists.txt;	\
	${PREFIX.ros-catkin}/bin/catkin_init_workspace

  # INSTALL script keeping track of ${PREFIX}/.catkin file
  include ${DEPEND_DIR.ros-catkin}/marker.mk
endif

endif # ROS_CATKIN_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
