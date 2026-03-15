cmake_minimum_required(VERSION 3.10)
project(harmperc)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CSOUND_FRAMEWORK "/Library/Frameworks/CsoundLib64.framework")
set(CSOUND_CURRENT "${CSOUND_FRAMEWORK}/Versions/Current")

add_library(harmperc MODULE src/harmperc.cpp)

target_include_directories(harmperc PRIVATE "${CSOUND_FRAMEWORK}/Headers")

target_link_libraries(harmperc PRIVATE 
    "${CSOUND_FRAMEWORK}"
    # Or: "-framework CsoundLib64" if using frameworks dir
)

set_target_properties(harmperc PROPERTIES
    PREFIX ""
    SUFFIX ".dylib"
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "${CSOUND_CURRENT}"
)
