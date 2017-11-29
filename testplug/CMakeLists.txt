project(testplug)
cmake_minimum_required(VERSION 3.2.2)

set(sources
    testplug.cpp
    mytime.cpp
)

set(headers
    testplug.h
    mytime.h
)

set(qmlcomponents
   "DigiClock 1.0 DigiClock.qml"
   "AltClock 1.0 AltClock.qml"
)

AddQMLPlugin(TestPlug TestPlug 1 0 "${sources}" "${headers}" "${qmlcomponents}")
