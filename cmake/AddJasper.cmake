INCLUDE(ExternalProject)

FIND_PACKAGE(jasper)

#------------------------------------------------
# JASPER
#------------------------------------------------
IF( NOT JASPER_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib jasper")

	SET(JASPER_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/jasper")
	SET(JASPER_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	SET(JASPER_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${JASPER_INSTALL_DIR}
							-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
							-DCMAKE_DEBUG_POSTFIX=d)
	
	ExternalProject_add(jasper
		PREFIX ${JASPER_PREFIX}
		GIT_REPOSITORY https://github.com/georgegerdin/jasper.git
		INSTALL_DIR ${JASPER_INSTALL_DIR}
		CMAKE_ARGS ${JASPER_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()