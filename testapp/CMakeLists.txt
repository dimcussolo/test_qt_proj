project(testapp)
cmake_minimum_required(VERSION 3.2.2)

set (sources
  main.cpp
)

add_executable(qmltest ${sources})
target_link_libraries(qmltest Qt5::Gui Qt5::Qml)

CreateFileCopyTarget(main_qml_copy main.qml ${PROJECT_OUTPUT_DIRECTORY}/main.qml)

