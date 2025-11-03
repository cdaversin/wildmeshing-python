# Prepare dependencies
#
# For each third-party library, if the appropriate target doesn't exist yet,
# download it via external project, and add_subdirectory to build it alongside
# this project.

### Configuration
set(WILDMESHING_ROOT     "${CMAKE_CURRENT_LIST_DIR}/..")
set(WILDMESHING_EXTERNAL ${THIRD_PARTY_DIR})

# Download and update 3rdparty libraries
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})
list(REMOVE_DUPLICATES CMAKE_MODULE_PATH)
include(WildMeshingDownloadExternal)

################################################################################
# Required libraries
################################################################################
include(FetchContent)
message(STATUS "(RE-)Installing libigl")
FetchContent_Declare(
	libigl
        GIT_REPOSITORY https://github.com/libigl/libigl.git
        GIT_TAG        v2.6.0   
)
set(LIBIGL_BUILD_STATIC ON CACHE BOOL "" FORCE)
set(LIBIGL_BUILD_SHARED OFF CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(libigl)

