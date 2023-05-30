cmake_minimum_required(VERSION 3.14)

project(MergeJobPlayground
    DESCRIPTION "Minimum Application Skelton"
    LANGUAGES CXX)

# Save all binaries to the shared directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_BUILD_TYPE Debug)

if (CMAKE_GENERATOR MATCHES "Visual Studio")
    set (CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR})
    set (CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR})
endif ()

macro(setup_executable _target)
    set(multiValueArgs SOURCES LIBRARIES PRIVATE_LIBRARIES)
    cmake_parse_arguments(opt "" "" "${multiValueArgs}" ${ARGN} )

    add_executable(${_target} ${opt_SOURCES})

    if (opt_PRIVATE_LIBRARIES)
        target_link_libraries(${_target} PRIVATE ${opt_PRIVATE_LIBRARIES})
    endif ()

    target_compile_options(${_target} PRIVATE -Wno-overloaded-virtual)

    if (CMAKE_GENERATOR MATCHES "Visual Studio")
        # Set the startup target to MiniBrowser
        set_property(DIRECTORY ${PROJECT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${_target})
    endif ()
endmacro()

set(SOURCES
    src/main.cpp
)

setup_executable(merge-job-playground SOURCES ${SOURCES})
