INCLUDE(ExternalProject)

FIND_PACKAGE(expat)

#------------------------------------------------
# EXPAT
#------------------------------------------------
IF( NOT EXPAT_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib expat")

	SET(EXPAT_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/expat")
	SET(EXPAT_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	SET(EXPAT_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${EXPAT_INSTALL_DIR}
							-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
							-DCMAKE_DEBUG_POSTFIX=d)
	
	ExternalProject_add(expat
		PREFIX ${EXPAT_PREFIX}
		URL http://downloads.sourceforge.net/project/expat/expat/2.1.0/expat-2.1.0.tar.gz
		URL_MD5 dd7dab7a5fea97d2a6a43f511449b7cd
		INSTALL_DIR ${EXPAT_INSTALL_DIR}
		CMAKE_ARGS ${EXPAT_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()