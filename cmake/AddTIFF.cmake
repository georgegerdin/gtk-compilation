INCLUDE(ExternalProject)

FIND_PACKAGE(TIFF)

#------------------------------------------------
# LibTiff
#------------------------------------------------
IF( NOT TIFF_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external libTIFF")

	SET(TIFF_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/tiff")
	SET(TIFF_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	SET(TIFF_CMAKE_ARGS		-DCMAKE_INSTALL_PREFIX=${TIFF_INSTALL_DIR}
							-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
							-DCMAKE_DEBUG_POSTFIX=d)
	
	ExternalProject_add(tiff
		PREFIX ${TIFF_PREFIX}
		GIT_REPOSITORY https://github.com/georgegerdin/libtiff.git

		INSTALL_DIR ${TIFF_INSTALL_DIR}
		CMAKE_ARGS ${TIFF_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()