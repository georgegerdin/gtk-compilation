include(ExternalProject)

find_package(PNG)

#------------------------------------------------
# LibPNG
#------------------------------------------------
if( NOT PNG_FOUND OR REBUILD_EXTLIBS)
	message(STATUS "Updating external lib LibPNG")

	set(PNG_PREFIX 		"${CMAKE_CURRENT_BINARY_DIR}/png")
	set(PNG_INSTALL_DIR	"${CMAKE_INSTALL_PREFIX}")
	set(PNG_CMAKE_ARGS	-DCMAKE_INSTALL_PREFIX=${PNG_INSTALL_DIR}
						-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
						-DCMAKE_DEBUG_POSTFIX=d)

	if(NOT TARGET zlib)
		add_custom_target(zlib)
	endif()
	
	ExternalProject_add(png
		DEPENDS	zlib
		PREFIX ${PNG_PREFIX}
		GIT_REPOSITORY https://github.com/winlibs/libpng.git
		INSTALL_DIR ${PNG_INSTALL_DIR}
		CMAKE_ARGS ${PNG_CMAKE_ARGS}
	)
	
	set(BUILD_MAIN_PROJECT FALSE)
endif()