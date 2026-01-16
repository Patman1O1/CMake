# cmake_uninstall.cmake

# Make sure the install manifest exists
if(NOT EXISTS "${CMAKE_BINARY_DIR}/install_manifest.txt")
    message(FATAL_ERROR "Cannot find install manifest: ${CMAKE_BINARY_DIR}/install_manifest.txt")
endif()

# Read the install manifest and parse it's contents
file(READ "${CMAKE_BINARY_DIR}/install_manifest.txt" FILES)
string(REGEX REPLACE "\n" ";" FILES "${FILES}")

# For each entry in the the install manifest
foreach(ENTRY ${FILES})
    message(STATUS "Uninstalling $ENV{DESTDIR}${ENTRY}")
    if(IS_SYMLINK "$ENV{DESTDIR}${ENTRY}" OR EXISTS "$ENV{DESTDIR}${ENTRY}")
        execute_process(
                COMMAND "${CMAKE_COMMAND}" -E remove "$ENV{DESTDIR}${ENTRY}"
                RESULT_VARIABLE EXIT_CODE
        )
        if(EXIT_CODE NOT EQUAL 0)
            message(FATAL_ERROR "Problem when removing $ENV{DESTDIR}${ENTRY}: ${ERROR}")
        endif()
    else()
        message(STATUS "Entry $ENV{DESTDIR}${ENTRY} does not exist.")
    endif()
endforeach()
