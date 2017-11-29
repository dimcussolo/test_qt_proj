project(testui)
cmake_minimum_required(VERSION 3.2.2)

file(GLOB_RECURSE qml_sources_list RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "${CMAKE_CURRENT_SOURCE_DIR}/*.qml")

CreateFilesCopyTarget(testui_qml_copy ${qml_sources_list} ${PROJECT_OUTPUT_DIRECTORY})

