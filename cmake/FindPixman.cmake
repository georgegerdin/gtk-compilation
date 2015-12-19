set(_PIXMAN_SEARCHES)

# Search PIXMAN_ROOT first if it is set.
if(PIXMAN_ROOT)
  set(_PIXMAN_SEARCH_ROOT PATHS ${PIXMAN_ROOT} NO_DEFAULT_PATH)
  list(APPEND _PIXMAN_SEARCHES _PIXMAN_SEARCH_ROOT)
endif()

# Normal search.
set(_PIXMAN_SEARCH_NORMAL
  PATHS "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Pixman;InstallPath]"
        "$ENV{PROGRAMFILES}/pixman"
  )
list(APPEND _PIXMAN_SEARCHES _PIXMAN_SEARCH_NORMAL)

set(PIXMAN_NAMES pixman-1_static)
set(PIXMAN_NAMES_DEBUG pixman-1_staticd)

# Try each search configuration.
foreach(search ${_PIXMAN_SEARCHES})
  find_path(PIXMAN_INCLUDE_DIR NAMES pixman-1/pixman.h ${${search}} PATH_SUFFIXES include)
endforeach()

# Allow PIXMAN_LIBRARY to be set manually, as the location of the PIXMAN library
if(NOT PIXMAN_LIBRARY)
  foreach(search ${_PIXMAN_SEARCHES})
    find_library(PIXMAN_LIBRARY_RELEASE NAMES ${PIXMAN_NAMES} ${${search}} PATH_SUFFIXES lib)
    find_library(PIXMAN_LIBRARY_DEBUG NAMES ${PIXMAN_NAMES_DEBUG} ${${search}} PATH_SUFFIXES lib)
  endforeach()

  include(${CMAKE_ROOT}/Modules/SelectLibraryConfigurations.cmake)
  select_library_configurations(PIXMAN)
endif()

unset(PIXMAN_NAMES)
unset(PIXMAN_NAMES_DEBUG)

mark_as_advanced(PIXMAN_LIBRARY PIXMAN_INCLUDE_DIR)

if(PIXMAN_INCLUDE_DIR AND EXISTS "${PIXMAN_INCLUDE_DIR}/PIXMAN.h")
    file(STRINGS "${PIXMAN_INCLUDE_DIR}/pixman-1/pixman-version.h" PIXMAN_H REGEX "^#define PIXMAN_VERSION \"[^\"]*\"$")

    string(REGEX REPLACE "^.*PIXMAN_VERSION \"([0-9]+).*$" "\\1" PIXMAN_VERSION_MAJOR "${PIXMAN_H}")
    string(REGEX REPLACE "^.*PIXMAN_VERSION \"[0-9]+\\.([0-9]+).*$" "\\1" PIXMAN_VERSION_MINOR  "${PIXMAN_H}")
    string(REGEX REPLACE "^.*PIXMAN_VERSION \"[0-9]+\\.[0-9]+\\.([0-9]+).*$" "\\1" PIXMAN_VERSION_PATCH "${PIXMAN_H}")
    set(PIXMAN_VERSION_STRING "${PIXMAN_VERSION_MAJOR}.${PIXMAN_VERSION_MINOR}.${PIXMAN_VERSION_PATCH}")

    # only append a TWEAK version if it exists:
    set(PIXMAN_VERSION_TWEAK "")
    if( "${PIXMAN_H}" MATCHES "PIXMAN_VERSION \"[0-9]+\\.[0-9]+\\.[0-9]+\\.([0-9]+)")
        set(PIXMAN_VERSION_TWEAK "${CMAKE_MATCH_1}")
        set(PIXMAN_VERSION_STRING "${PIXMAN_VERSION_STRING}.${PIXMAN_VERSION_TWEAK}")
    endif()

    set(PIXMAN_MAJOR_VERSION "${PIXMAN_VERSION_MAJOR}")
    set(PIXMAN_MINOR_VERSION "${PIXMAN_VERSION_MINOR}")
    set(PIXMAN_PATCH_VERSION "${PIXMAN_VERSION_PATCH}")
endif()

# handle the QUIETLY and REQUIRED arguments and set PIXMAN_FOUND to TRUE if
# all listed variables are TRUE
include(${CMAKE_ROOT}/Modules/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(PIXMAN REQUIRED_VARS PIXMAN_LIBRARY PIXMAN_INCLUDE_DIR
                                       VERSION_VAR PIXMAN_VERSION_STRING)
									   
if(PIXMAN_FOUND)
    set(PIXMAN_INCLUDE_DIRS ${PIXMAN_INCLUDE_DIR})

    if(NOT PIXMAN_LIBRARIES)
      set(PIXMAN_LIBRARIES ${PIXMAN_LIBRARY})
    endif()

    if(NOT TARGET PIXMAN::PIXMAN)
      add_library(PIXMAN::PIXMAN UNKNOWN IMPORTED)
      set_target_properties(PIXMAN::PIXMAN PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${PIXMAN_INCLUDE_DIRS}")

      if(PIXMAN_LIBRARY_RELEASE)
        set_property(TARGET PIXMAN::PIXMAN APPEND PROPERTY
          IMPORTED_CONFIGURATIONS RELEASE)
        set_target_properties(PIXMAN::PIXMAN PROPERTIES
          IMPORTED_LOCATION_RELEASE "${PIXMAN_LIBRARY_RELEASE}")
      endif()

      if(PIXMAN_LIBRARY_DEBUG)
        set_property(TARGET PIXMAN::PIXMAN APPEND PROPERTY
          IMPORTED_CONFIGURATIONS DEBUG)
        set_target_properties(PIXMAN::PIXMAN PROPERTIES
          IMPORTED_LOCATION_DEBUG "${PIXMAN_LIBRARY_DEBUG}")
      endif()

      if(NOT PIXMAN_LIBRARY_RELEASE AND NOT PIXMAN_LIBRARY_DEBUG)
        set_property(TARGET PIXMAN::PIXMAN APPEND PROPERTY
          IMPORTED_LOCATION "${PIXMAN_LIBRARY}")
      endif()
    endif()
endif()