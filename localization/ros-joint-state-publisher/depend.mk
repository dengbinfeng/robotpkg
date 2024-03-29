# robotpkg depend.mk for:	localization/ros-joint-state-publisher
# Created:			Anthony Mallet on Tue, 11 Sep 2018
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_JOINT_STATE_PUBLISHER_DEPEND_MK:=	${ROS_JOINT_STATE_PUBLISHER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-joint-state-publisher
endif

ifeq (+,$(ROS_JOINT_STATE_PUBLISHER_DEPEND_MK)) # --------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-joint-state-publisher?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-joint-state-publisher?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-joint-state-publisher
ROS_DEPEND_USE+=		ros-joint-state-publisher

DEPEND_DIR.ros-joint-state-publisher?=\
  ../../localization/ros-joint-state-publisher
DEPEND_ABI.ros-joint-state-publisher?=\
  ros-joint-state-publisher>=1.12

SYSTEM_SEARCH.ros-joint-state-publisher=\
  'lib/joint_state_publisher/joint_state_publisher'			\
  'share/joint_state_publisher/cmake/joint_state_publisherConfig.cmake'	\
  'share/joint_state_publisher/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/joint_state_publisher.pc:/Version/s/[^0-9.]//gp'

endif # ROS_JOINT_STATE_PUBLISHER_DEPEND_MK --------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
