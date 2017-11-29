project(testproj)
cmake_minimum_required(VERSION 3.2.2)

if(UNIX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
endif()

set(BUILD_SHARED_LIBS ON)

if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
   add_definitions(-DQT_QML_DEBUG )
   add_definitions(-DQT_DECLARATIVE_DEBUG )
endif()

set(QT_PATH "/opt/Qt5.6.2")

list(APPEND CMAKE_PREFIX_PATH
  "${QT_PATH}/5.6/gcc_64"
)

find_package(Qt5Core REQUIRED)
find_package(Qt5Gui REQUIRED)
find_package(Qt5Qml REQUIRED)
find_package(Qt5Quick REQUIRED)

include(${CMAKE_SOURCE_DIR}/cmake/tools.cmake)

set(PROJECT_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_OUTPUT_DIRECTORY})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_OUTPUT_DIRECTORY}) 

add_subdirectory(testapp)
add_subdirectory(testplug)
add_subdirectory(otherplug)
add_subdirectory(testui)


