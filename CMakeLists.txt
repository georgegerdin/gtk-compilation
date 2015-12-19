CMAKE_MINIMUM_REQUIRED(VERSION 2.8.3)

PROJECT( gtk-stack )

IF( APPLE OR UNIX )
	MESSAGE("Enabling C++ 11...")
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y")
    IF( APPLE )
        MESSAGE("Enabling C++ 11 standard library...")
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
    ENDIF()

ENDIF()

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
SET(BUILD_MAIN_PROJECT TRUE)
OPTION(REBUILD_EXTLIBS "Rebuilds external libraries" OFF)

INCLUDE(AddZLIB)
INCLUDE(AddPNG)
INCLUDE(AddPixman)
