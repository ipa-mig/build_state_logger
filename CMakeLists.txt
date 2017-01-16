cmake_minimum_required(VERSION 2.8.3)
project(build_state_logger)

find_package(catkin REQUIRED)

catkin_package()

add_custom_target(build_this ALL
  ${CMAKE_CURRENT_SOURCE_DIR}/scripts/build_state ${CMAKE_CURRENT_SOURCE_DIR}
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/../src/
)

catkin_install_python(
  PROGRAMS scripts/build_state
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(
  FILES build_state.log
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
