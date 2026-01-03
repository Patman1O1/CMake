cmake_minimum_required(VERSION 4.2)
project(CMake
        LANGUAGES NONE
        VERSION 0.1.0)

include(CMakePackageConfigHelpers)

add_custom_target(cmake ALL )

configure_package_config_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/cmake-config.cmake.in"
        "cmake-config.cmake"
        INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cmake")

write_basic_package_version_file(
        "cmake-config-version.cmake"
        COMPATIBILITY SameMajorVersion)

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/include/"
        TYPE INCLUDE
        COMPONENT cmake-dev)

#install(TARGETS cmake
        #EXPORT cmake-targets
        #COMPONENT cmake-dev)

install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/cmake-config.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/cmake-config-version.cmake"
        COMPONENT cmake-dev
        DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cmake")

