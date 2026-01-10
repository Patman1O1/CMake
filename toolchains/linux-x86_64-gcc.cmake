# -------------------------------------------------
# Linux x86-64 GCC Toolchain
# -------------------------------------------------
set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_SYSTEM_PROCESSOR "x86_64")
find_program(CMAKE_C_COMPILER "gcc" REQUIRED)
find_program(CMAKE_CXX_COMPILER "g++" REQUIRED)
