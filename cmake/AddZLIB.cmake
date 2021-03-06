INCLUDE(ExternalProject)

FIND_PACKAGE(ZLIB)

#------------------------------------------------
# LibPNG
#------------------------------------------------
IF( NOT ZLIB_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib ZLib")

	SET(ZLIB_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/zlib")
	SET(ZLIB_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	SET(ZLIB_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${ZLIB_INSTALL_DIR}
						-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
						-DCMAKE_DEBUG_POSTFIX=d)
	
	ExternalProject_add(zlib
		PREFIX ${ZLIB_PREFIX}
		GIT_REPOSITORY https://github.com/madler/zlib.git
		INSTALL_DIR ${ZLIB_INSTALL_DIR}
		CMAKE_ARGS ${ZLIB_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()