# -------------------------------------------------
# Linux ARM32 (hard-float) GCC Toolchain
# -------------------------------------------------
set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_SYSTEM_PROCESSOR "armv7")

set(TOOLCHAIN_TRIPLET "arm-linux-gnueabihf")

find_program(CMAKE_C_COMPILER "${TOOLCHAIN_TRIPLET}-gcc" REQUIRED)
find_program(CMAKE_CXX_COMPILER "${TOOLCHAIN_TRIPLET}-g++" REQUIRED)

set(CMAKE_SYSROOT "/usr/${TOOLCHAIN_TRIPLET}")
set(CMAKE_FIND_ROOT_PATH "${CMAKE_SYSROOT}")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
