cmake_minimum_required(VERSION 3.28.0)
project(CMake
        LANGUAGES NONE
        VERSION 0.1.0
        DESCRIPTION "A project that contains CMake presets, modules, toolchains, and templates.")

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

configure_package_config_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/cmake-config.cmake.in"
        "cmake-config.cmake"
        INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cmake"
        NO_CHECK_REQUIRED_COMPONENTS_MACRO)

write_basic_package_version_file("cmake-config-version.cmake"
        COMPATIBILITY SameMajorVersion)

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/modules"
        DESTINATION "${CMAKE_INSTALL_SYSCONFDIR}/cmake"
        COMPONENT cmake-dev)

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/presets"
        DESTINATION "${CMAKE_INSTALL_SYSCONFDIR}/cmake"
        COMPONENT cmake-dev)

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/scripts"
        DESTINATION "${CMAKE_INSTALL_SYSCONFDIR}/cmake"
        COMPONENT cmake-dev)

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/templates"
        DESTINATION "${CMAKE_INSTALL_SYSCONFDIR}/cmake"
        COMPONENT cmake-dev)

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/toolchains"
        DESTINATION "${CMAKE_INSTALL_SYSCONFDIR}/cmake"
        COMPONENT cmake-dev)

install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/cmake-config.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/cmake-config-version.cmake"
        COMPONENT cmake-dev
        DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cmake")

if(NOT TARGET uninstall)
    add_custom_target(uninstall
            COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/scripts/cmake_uninstall.cmake
            COMMENT "Uninstalling all installed files...")
endif()
