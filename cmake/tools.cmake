function(JOIN OUTPUT GLUE)
    set(_TMP_RESULT "")
    set(_GLUE "") # effective glue is empty at the beginning
    foreach(arg ${ARGN})
        set(_TMP_RESULT "${_TMP_RESULT}${_GLUE}${arg}")
        set(_GLUE "${GLUE}")
    endforeach()
    set(${OUTPUT} "${_TMP_RESULT}" PARENT_SCOPE)
endfunction()

function(CreateFilesCopyTarget
    target_name
    files_list
    target_dir)
    file(TO_CMAKE_PATH ${target_dir} fixed_target_dir)
    foreach(filename ${files_list})
        file(TO_CMAKE_PATH ${filename} fixed_filename)
        if (IS_ABSOLUTE ${fixed_filename})
            get_filename_component(_name ${fixed_filename} NAME)
            get_filename_component(_dir ${fixed_filename} PATH)
        else()
            set(_name ${fixed_filename})
            set(_dir ${CMAKE_CURRENT_SOURCE_DIR})
        endif()
        set(dest ${fixed_target_dir}/${_name})
        add_custom_command(
            OUTPUT ${dest}
            COMMAND ${CMAKE_COMMAND}
            ARGS -E copy_if_different ${_dir}/${_name} ${dest}
            DEPENDS ${_dir}/${_name}
        )
        list(APPEND dest_files ${dest})
    endforeach()
    add_custom_target(${target_name} ALL DEPENDS ${dest_files})
    if(${ARGV3})
        add_dependencies(${ARGV3} ${target_name})
    endif()
endfunction()

function(CreateFileCopyTarget
    target_name
    filename
    filename_dst)
    file(TO_CMAKE_PATH ${filename_dst} fixed_filename_dst)
    file(TO_CMAKE_PATH ${filename} fixed_filename_src)
    if (IS_ABSOLUTE ${fixed_filename_src})
        get_filename_component(_name ${fixed_filename_src} NAME)
        get_filename_component(_dir ${fixed_filename_src} PATH)
    else()
        set(_name ${fixed_filename_src})
        set(_dir ${CMAKE_CURRENT_SOURCE_DIR})
    endif()
    add_custom_command(
        OUTPUT ${fixed_filename_dst}
        COMMAND ${CMAKE_COMMAND}
        ARGS -E copy_if_different ${_dir}/${_name} ${fixed_filename_dst}
        DEPENDS ${_dir}/${_name}
    )
    add_custom_target(${target_name} ALL DEPENDS ${fixed_filename_dst})
    if(${ARGV3})
        add_dependencies(${ARGV3} ${target_name})
    endif()
endfunction()

function(AddQMLPlugin PLUGIN_NAME URI PLUGIN_MAJOR_VERSION PLUGIN_MINOR_VERSION SOURCE_FILES HEADERS QMLCOMPONENTS)
    qt5_wrap_cpp(moc_files ${HEADERS})
    set(PLUGIN_OUTPUT_DIRECTORY "${PROJECT_OUTPUT_DIRECTORY}/${PLUGIN_NAME}")
    add_library(${PLUGIN_NAME} ${SOURCE_FILES} ${moc_files})
    set_target_properties(${PLUGIN_NAME} PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY ${PLUGIN_OUTPUT_DIRECTORY}
        RUNTIME_OUTPUT_DIRECTORY ${PLUGIN_OUTPUT_DIRECTORY}
    )
    target_link_libraries(${PLUGIN_NAME} Qt5::Gui Qt5::Qml Qt5::Quick)
    file(WRITE "${PLUGIN_OUTPUT_DIRECTORY}/qmldir" "module ${URI}\nplugin ${PLUGIN_NAME}")
    set(qml_sources_list "")
    foreach(qmlcomponent ${QMLCOMPONENTS})
        set(templist ${qmlcomponent})
        separate_arguments(templist)
        list(GET templist 2 qmlfile)
        list(APPEND qml_sources_list ${qmlfile})
        file(APPEND "${PLUGIN_OUTPUT_DIRECTORY}/qmldir" "\n${qmlcomponent}")
    endforeach()
    CreateFilesCopyTarget(${PLUGIN_NAME}_qml_copy "${qml_sources_list}" ${PLUGIN_OUTPUT_DIRECTORY})
endfunction()

