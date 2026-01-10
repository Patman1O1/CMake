# -------------------------------------------------
# Linux ARM64 GCC Toolchain
# -------------------------------------------------
set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_SYSTEM_PROCESSOR "aarch64")

find_program(CMAKE_C_COMPILER "aarch64-linux-gnu-gcc" REQUIRED)
find_program(CMAKE_CXX_COMPILER "aarch64-linux-gnu-g++" REQUIRED)

set(CMAKE_SYSROOT "/usr/aarch64-linux-gnu")
set(CMAKE_FIND_ROOT_PATH "${CMAKE_SYSROOT}")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
