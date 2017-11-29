project(otherplug)
cmake_minimum_required(VERSION 3.2.2)

set(sources
    otherplug.cpp
    mydate.cpp
)

set(headers
    otherplug.h
    mydate.h
)

AddQMLPlugin(OtherPlug OtherPlug 1 0 "${sources}" "${headers}" "DigiCalend 1.0 DigiCalend.qml")
