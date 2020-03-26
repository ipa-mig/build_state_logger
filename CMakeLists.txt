cmake_minimum_required(VERSION 2.8.3)
project(build_state_logger)

find_package(catkin REQUIRED)

catkin_package()

execute_process(
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/bin/upsearch.sh ${CMAKE_CURRENT_SOURCE_DIR}
  OUTPUT_VARIABLE CATKIN_WORKSPACE
)

if ("${CATKIN_WORKSPACE}" STREQUAL "")
  message(WARNING "Not inside a catkin workspace. Not logging build state.")
else()

  add_custom_target(build_this ALL
    ${CMAKE_CURRENT_SOURCE_DIR}/scripts/build_state -o ${CMAKE_CURRENT_SOURCE_DIR} ${CATKIN_WORKSPACE}
  )

  catkin_install_python(
    PROGRAMS scripts/build_state
    DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  )

  install(
    FILES build_state.log
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  )

endif()
