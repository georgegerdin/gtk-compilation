INCLUDE(ExternalProject)

FIND_PACKAGE(iconv)

#------------------------------------------------
# ICONV
#------------------------------------------------
IF( NOT ICONV_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib Iconv")

	SET(ICONV_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/iconv")
	SET(ICONV_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	SET(ICONV_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${ICONV_INSTALL_DIR}
							-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
							-DCMAKE_DEBUG_POSTFIX=d)
	
	ExternalProject_add(iconv
		PREFIX ${ICONV_PREFIX}
		GIT_REPOSITORY https://github.com/win-iconv/win-iconv.git
		INSTALL_DIR ${ICONV_INSTALL_DIR}
		CMAKE_ARGS ${ICONV_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()