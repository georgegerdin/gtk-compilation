INCLUDE(ExternalProject)

FIND_PACKAGE(BZip2)

#------------------------------------------------
# BZip2
#------------------------------------------------
IF( NOT BZIP2_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib BZip2")

	SET(BZip2_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/bzip2")
	SET(BZip2_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	SET(BZip2_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${BZip2_INSTALL_DIR}
							-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
							-DCMAKE_DEBUG_POSTFIX=d)
	
	ExternalProject_add(bzip2
		PREFIX ${BZip2_PREFIX}
		GIT_REPOSITORY https://github.com/osrf/bzip2_cmake.git
		INSTALL_DIR ${BZip2_INSTALL_DIR}
		CMAKE_ARGS ${BZip2_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()