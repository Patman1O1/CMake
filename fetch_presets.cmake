# If FetchContent has not been included...
if(NOT COMMAND FetchContent)
    include(FetchContent)
endif()

# Fetch the CMakePresets.json file from the CMake Github repository
FetchContent_Declare(
        cmake_presets
        URL https://raw.githubusercontent.com/Patman1O1/CMake/main/CMakePresets.json
)

# Make the CMakePresets.json file available to use
FetchContent_MakeAvailable(cmake_presets)

# Copy the presets into your project directory
file(
        COPY ${cmake_presets_SOURCE_DIR}/CMakePresets.json
        DESTINATION ${CMAKE_SOURCE_DIR}
)