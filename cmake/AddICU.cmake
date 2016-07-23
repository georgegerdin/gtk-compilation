INCLUDE(ExternalProject)

FIND_PACKAGE(ICU)

if (NOT ICU_FOUND OR REBUILD_EXTLIBS)
	MESSAGE(STATUS "Updating external lib ICU...")
	
	set(ICU_PREFIX			"${CMAKE_CURRENT_BINARY_DIR}/icu")

	if(MSVC)
		if(CMAKE_BUILD_TYPE MATCHES DEBUG)
			set(CONFIGURATION "Debug")
		else()
			set(CONFIGURATION "Release")
		endif()	
	
		ExternalProject_add(icu
			PREFIX ${ICU_PREFIX}
			URL "http://download.icu-project.org/files/icu4c/57.1/icu4c-57_1-src.zip"
			URL_MD5 "f797503ecaebf1d38920013dc7893066"
			BUILD_COMMAND msbuild <BINARY_DIR>/allinone/allinone.sln /p:Configuration=${CONFIGURATION}
		)			
	else()
	endif()
endif()