INCLUDE(ExternalProject)

FIND_PACKAGE(freetype)

#------------------------------------------------
# FREETYPE
#------------------------------------------------
IF( NOT FREETYPE_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib Freetype")

	SET(FREETYPE_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/freetype")
	SET(FREETYPE_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	SET(FREETYPE_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${FREETYPE_INSTALL_DIR}
							-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
							-DCMAKE_DEBUG_POSTFIX=d)
	
	if(NOT TARGET zlib)
		add_custom_target(zlib)
	endif()
	
	if(NOT TARGET bzip2)
		add_custom_target(bzip2)
	endif()
	
	if(NOT TARGET png)
		add_custom_target(png)
	endif()
	
	ExternalProject_add(freetype
		DEPENDS zlib bzip2 png
		PREFIX ${FREETYPE_PREFIX}
		GIT_REPOSITORY https://github.com/georgegerdin/freetype-cmake-win32.git
		INSTALL_DIR ${FREETYPE_INSTALL_DIR}
		CMAKE_ARGS ${FREETYPE_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()