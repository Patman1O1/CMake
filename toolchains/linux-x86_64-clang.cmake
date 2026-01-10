# -------------------------------------------------
# Linux x86-64 Clang Toolchain
# -------------------------------------------------
set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_SYSTEM_PROCESSOR "x86_64")
find_program(CMAKE_C_COMPILER "clang" REQUIRED)
find_program(CMAKE_CXX_COMPILER "clang++" REQUIRED)
find_program(LLD lld)
if(LLD)
    set(CMAKE_EXE_LINKER_FLAGS_INIT    "-fuse-ld=lld")
    set(CMAKE_SHARED_LINKER_FLAGS_INIT "-fuse-ld=lld")
    set(CMAKE_MODULE_LINKER_FLAGS_INIT "-fuse-ld=lld")
endif()
