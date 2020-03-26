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

in the directory in which you want the build state to be logged.

### Command line arguments
  -h, --help            show this help message and exit
  -o OUTPUTPATH, --outpath OUTPUTPATH
                        the path of where to put the build_state.log file. If
                        empty, the output is shown on the terminal.
  -n, --nopatch         do not provide patches of changed files.
  -d, --list-debs       list also all installed debian packages
  -p, --list-pypkgs     list also all installed python packages
  
Note that when using `--list-pypkgs` this takes all packages on the current python path.
If your workspace is usually run using a virtual environment, you need to source this prior to running the script too.


Licensing
---------
This package is licensed under [LGPL](https://www.gnu.org/licenses/licenses.en.html#LGPL).
`gitpyhon` is licensed under the
[new BSD license](https://github.com/gitpython-developers/GitPython/blob/master/LICENSE).
