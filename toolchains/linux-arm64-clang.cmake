# -------------------------------------------------
# Linux ARM64 Clang Toolchain
# -------------------------------------------------
set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_SYSTEM_PROCESSOR "aarch64")

find_program(CMAKE_C_COMPILER "clang" REQUIRED)
find_program(CMAKE_CXX_COMPILER "clang++" REQUIRED)

set(CMAKE_C_COMPILER_TARGET "aarch64-linux-gnu")
set(CMAKE_CXX_COMPILER_TARGET "aarch64-linux-gnu")

set(CMAKE_SYSROOT "/usr/aarch64-linux-gnu")
set(CMAKE_FIND_ROOT_PATH "${CMAKE_SYSROOT}")

find_program(LLD "lld")
if(LLD)
    set(CMAKE_LINKER "${LLD}")
endif()

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
