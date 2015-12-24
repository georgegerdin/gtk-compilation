INCLUDE(ExternalProject)

FIND_PACKAGE(TIFF)

#------------------------------------------------
# LibTiff
#------------------------------------------------
IF( NOT TIFF_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external libTIFF")

	SET(TIFF_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/tiff")
	SET(TIFF_INSTALL_DIR	"${CMAKE_CURRENT_BINARY_DIR}")
	SET(TIFF_CMAKE_ARGS		-DCMAKE_INSTALL_PREFIX=${TIFF_INSTALL_DIR})
	
	ExternalProject_add(tiff
		PREFIX ${TIFF_PREFIX}
		GIT_REPOSITORY https://github.com/georgegerdin/libtiff.git

		INSTALL_DIR ${TIFF_INSTALL_DIR}
		CMAKE_ARGS ${TIFF_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()