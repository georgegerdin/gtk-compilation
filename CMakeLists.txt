cmake_minimum_required(VERSION 3.2)

project( gtk-stack )

if( APPLE OR UNIX )
	message("Enabling C++ 11...")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y")
    if( APPLE )
        message("Enabling C++ 11 standard library...")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
    endif()

endif()

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
set(BUILD_MAIN_PROJECT TRUE)
option(REBUILD_EXTLIBS "Rebuilds external libraries" OFF)

set(CMAKE_INSTALL_PREFIX "C:/projects/dependencies")
set(CMAKE_PREFIX_PATH ${CMAKE_INSTALL_PREFIX})

include(AddZLIB)
include(AddPNG)
include(AddBZip2)
include(AddPixman)
include(AddJpegTurbo)
include(AddTIFF)
include(AddJasper)
include(AddFreetype)
include(AddExpat)
include(AddIconv)
include(AddGettext)
include(AddICU)
