build_state_logger
=========
Ever wondered in which state your workspace was, when you called `catkin_make install`?
This package will help you with this.

It creates a log of changes showing you detailed information about your workspace.
Which repository was in which state?
Have any files been changed, added, removed or renamed?

(Disclaimer: Obviously, this package also works with the `catkin_tools` variants of the catkin commands.
However, we will only stick to `catkin_make` in the following for an easier read.)

Installation
------------
This tool depends on the [`gitpython` module](https://gitpython.readthedocs.io).
To install `gitpython`, simply run `pip install gitpython`.

Usage
------
There are several ways to use this tool.

1. Via `CMake` during the build and install step of `catkin_make` by cloning the repository.
1. By manually calling the tool via `rosrun`.

### Via `CMake`
Simply clone this repository into your catkin workspace.
When compiling your workspace, it automatically creates the `build_state.log` within the `build_state_logger` directory.
When you install your workspace, the `build_state.log` file will be installed in `install/share/build_state_logger`.

The tool looks at all repositories in `<YOUR_WORKSPACE>/src` directory.

**Note** that in the current state, the log file will be generated on each run of CMake, i.e. at each call to
`catkin_make` and `catkin_make install`

### Via `rosrun`
As this is a regular ROS package this tool can also be used as any other python node.
Just make sure it is on your `ROS_PACKAGE_PATH` and call

`rosrun build_state_logger build_state`

If you want the log file `build_state.log` to be put into a log file in the current working directory,
you can specify the output path on the command line:

`rosrun build_state_logger build_state -o <OUTPUTPATH>`

Note that if you don't want detailed patch information, but just want to see if a file has been modified,
use the `-n` flag.

Licensing
---------
This package is licensed under [LGPL](https://www.gnu.org/licenses/licenses.en.html#LGPL).
`gitpyhon` is licensed under the
[new BSD license](https://github.com/gitpython-developers/GitPython/blob/master/LICENSE).
