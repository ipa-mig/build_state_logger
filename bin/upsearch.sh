#!/bin/sh
upsearch () {
  cd $1
  test / = "$PWD" && return || (test -e ".catkin_workspace" || test -e ".catkin_tools" || (test -e "src" && (test -e "src/CMakeLists.txt" && grep "catkin_workspace()" src/CMakeLists.txt > /dev/null))) && echo -n "$PWD" && return || cd .. && upsearch "$PWD"
}

upsearch $1
