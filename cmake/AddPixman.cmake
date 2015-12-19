INCLUDE(ExternalProject)

FIND_PACKAGE(Pixman)

#------------------------------------------------
# Pixman
#------------------------------------------------
IF( NOT PIXMAN_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib Pixman")

	SET(PIXMAN_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/pixman")
	SET(PIXMAN_INSTALL_DIR	"${CMAKE_CURRENT_BINARY_DIR}")
	SET(PIXMAN_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${PIXMAN_INSTALL_DIR})
	
	ExternalProject_add(pixman
		PREFIX ${PIXMAN_PREFIX}
		GIT_REPOSITORY https://github.com/CMakePorts/cmake.pixman.git
		GIT_TAG cmake
		INSTALL_DIR ${PIXMAN_INSTALL_DIR}
		CMAKE_ARGS ${PIXMAN_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()