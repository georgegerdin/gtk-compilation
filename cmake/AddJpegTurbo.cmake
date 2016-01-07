INCLUDE(ExternalProject)

FIND_PACKAGE(turbojpeg)

#------------------------------------------------
# TurboJPEG
#------------------------------------------------
IF( NOT TURBOJPEG_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib libjpeg-turbo")

	SET(JPEGTURBO_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/jpegturbo")
	SET(JPEGTURBO_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	SET(JPEGTURBO_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${JPEGTURBO_INSTALL_DIR}
								-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
							    -DCMAKE_DEBUG_POSTFIX=d)
	
	ExternalProject_add(JPEGTURBO
		PREFIX ${JPEGTURBO_PREFIX}
		GIT_REPOSITORY https://github.com/libjpeg-turbo/libjpeg-turbo.git
		INSTALL_DIR ${JPEGTURBO_INSTALL_DIR}
		CMAKE_ARGS ${JPEGTURBO_CMAKE_ARGS}
	)
	
	SET(BUILD_MAIN_PROJECT FALSE)
ENDIF()