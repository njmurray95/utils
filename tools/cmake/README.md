# CMake

> CMake is an open-source, cross-platform family of tools designed to build, test and package software. CMake is used to control the software compilation process using simple platform and compiler independent configuration files, and generate native makefiles and workspaces that can be used in the compiler environment of your choice. 

> -- CMake Homepage: https://cmake.org/

Great functionality, horrible atrocious syntax. CMake will build systems that build systems. It can make Makefiles for Linux, Visual Studio Projects for Windows, etc. etc. This means that (in theory) one build system to rule them all, one set of files that works cross-platform.

The developers of CMake opted not to configure projects with an existing programming language, but instead opted for their own CMake-specific syntax, which is at the root of most frustrations with the software.

## Installation

Get the most recent version from the [CMake official download page](https://cmake.org/download/). CMake changes often enough that old versions cannot build projects configured for newer versions. In fact, many CMake projects make this explicit from the very first lines of `CMakeLists.txt`:

```
cmake_minimum_requires(VERSION 3.16.0)
```

## Files

* `CMakeLists.txt`: The main file(s) used to specify how to build targets in the current folder and its subfolders
* `CMakeCache.txt`: A cachefile used by CMake to avoid re-running certain config scripts. This file needs to be deleted between runs if running CMake with different arguments. (CMake assumes you *don't* want idempotent CLI commands.)

## Notes

---

**External Project** ([Docs](https://cmake.org/cmake/help/v3.0/module/ExternalProject.html)):

```
include(ExternalProject)

ExternalProject_Add(
    PROJECT_NAME
    GIT_REPOSITORY "url"
    GIT_TAG "102308hash"
)
```

Can also specify custom build commands to build the external with something besides CMake:

```
ExternalProject_Add(
    PROJECT_NAME
    BUILD_COMMAND $(make)
)
```

With the options to set the `CONFIGURE_COMMAND`, `BUILD_COMMAND`, and `INSTALL_COMMAND`.

To chain multiple commands together, you have to specify another `COMMAND`:

```
ExternalProject_Add(
    PROJECT_NAME
    CONFIGURE_COMMAND cd <SOURCE_DIR> COMMAND python waf configure
    BUILD_COMMAND cd <SOURCE_DIR> COMMAND python waf build
)
```

The `<SOURCE_DIR>` in the above accesses the default option for the code install used by `ExternalProject_Add`. (That is the real syntax.) For a full example of such options, see the CMake docs above.

---
    
**Debug**
    
Print-debug some CMake variable:

```
message(FATAL_ERROR "${VAR}")
```
