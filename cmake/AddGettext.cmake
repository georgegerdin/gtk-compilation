INCLUDE(ExternalProject)

FIND_PACKAGE(gettext)

#------------------------------------------------
# GETTEXT
#------------------------------------------------
IF( NOT GETTEXT_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib gettext-runtime")

	SET(GETTEXT_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/gettext")
	SET(GETTEXT_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	SET(GETTEXT_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${GETTEXT_INSTALL_DIR}
							-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
							-DCMAKE_DEBUG_POSTFIX=d)
	
	ExternalProject_add(gettext
		PREFIX ${GETTEXT_PREFIX}
		GIT_REPOSITORY https://github.com/georgegerdin/gettext-cmake.git
		INSTALL_DIR ${GETTEXT_INSTALL_DIR}
		CMAKE_ARGS ${GETTEXT_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()