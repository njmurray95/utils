# CMake

Great functionality, horrible atrocious syntax.

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
