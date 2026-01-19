#-----------------------------------------------------------------------------------------------------------------------
# Variables
#-----------------------------------------------------------------------------------------------------------------------
set(CMAKE_MINIMUM_REQUIRED_VERSION 3.28.0 CACHE STRING "CMAKE_MINIMUM_REQUIRED_VERSION")
set(CMAKE_VERSION 4.2.1 CACHE STRING "CMAKE_VERSION") # Always make CMAKE_VERSION the latest version of CMake

#-----------------------------------------------------------------------------------------------------------------------
# set_if_not_defined()
#
#
# Parameters:
#   VARIABLE - The variable to set
#   VALUE - The value VARIABLE will be set to
#
#-----------------------------------------------------------------------------------------------------------------------
function(set_if_not_defined VARIABLE VALUE)
    if(NOT VARIABLE)
        set(VARIABLE VALUE PARENT_SCOPE)
    endif()
endfunction()

#-----------------------------------------------------------------------------------------------------------------------
# include_gtest()
#
#
#-----------------------------------------------------------------------------------------------------------------------
function(include_gtest)
    FetchContent_Declare(
            googletest
            GIT_REPOSITORY "https://github.com/google/googletest.git"
            GIT_TAG release-1.12.1
    )

    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE) # do not override parent project's runtime settings on Windows
    set(INSTALL_GTEST OFF)

    # For simplicity, always build-presets googletest as static library. This prevents @NAME@-tests executable from
    # complaining about missing googletest DLLs on Windows.
    set(BUILD_SHARED_LIBS OFF)

    FetchContent_MakeAvailable(googletest)

    include(GoogleTest)
endfunction()


#-----------------------------------------------------------------------------------------------------------------------
# build_docs()
#
#
#-----------------------------------------------------------------------------------------------------------------------
function(build_docs)
    find_package(Doxygen REQUIRED)
    doxygen_add_docs(docs include)
endfunction()
