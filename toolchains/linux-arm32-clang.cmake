# -------------------------------------------------
# Linux ARM32 Clang Toolchain
# -------------------------------------------------
set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_SYSTEM_PROCESSOR "armv7")

find_program(CMAKE_C_COMPILER "clang" REQUIRED)
find_program(CMAKE_CXX_COMPILER "clang++" REQUIRED)

set(CMAKE_C_COMPILER_TARGET "arm-linux-gnueabihf")
set(CMAKE_CXX_COMPILER_TARGET "arm-linux-gnueabihf")

set(CMAKE_SYSROOT "/usr/arm-linux-gnueabihf")
set(CMAKE_FIND_ROOT_PATH "${CMAKE_SYSROOT}")

find_program(LLD "lld")
if(LLD)
    set(CMAKE_EXE_LINKER_FLAGS_INIT    "-fuse-ld=lld")
    set(CMAKE_SHARED_LINKER_FLAGS_INIT "-fuse-ld=lld")
    set(CMAKE_MODULE_LINKER_FLAGS_INIT "-fuse-ld=lld")
endif()

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
