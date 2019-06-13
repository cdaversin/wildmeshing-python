################################################################################
include(DownloadProject)

# With CMake 3.8 and above, we can hide warnings about git being in a
# detached head by passing an extra GIT_CONFIG option
if(NOT (${CMAKE_VERSION} VERSION_LESS "3.8.0"))
    set(WILDMESHING_EXTRA_OPTIONS "GIT_CONFIG advice.detachedHead=false")
else()
    set(WILDMESHING_EXTRA_OPTIONS "")
endif()

# Shortcut function
function(wildmeshing_download_project name)
    download_project(
        PROJ         ${name}
        SOURCE_DIR   ${WILDMESHING_EXTERNAL}/${name}
        DOWNLOAD_DIR ${WILDMESHING_EXTERNAL}/.cache/${name}
        QUIET
        ${WILDMESHING_EXTRA_OPTIONS}
        ${ARGN}
    )
endfunction()

################################################################################


function(wildmeshing_download_triwild)
    wildmeshing_download_project(triwild
        GIT_REPOSITORY https://github.com/wildmeshing/TriWild/
        GIT_TAG         a563fd98945f39d0bab8ac38ec37c201b79aac5e
    )
endfunction()

function(wildmeshing_download_tetwild)
    wildmeshing_download_project(tetwild
        URL      https://www.dropbox.com/s/nen24j1lgn49p7h/code.zip?dl=0
        URL_MD5  03a41b34563092d3879002664830c538
    )
endfunction()

function(wildmeshing_download_pybind11)
    wildmeshing_download_project(pybind11
        GIT_REPOSITORY https://github.com/pybind/pybind11.git
        GIT_TAG        085a29436a8c472caaaf7157aa644b571079bcaa
    )
endfunction()

# data
function(wildmeshing_download_data)
    wildmeshing_download_project(data
        GIT_REPOSITORY https://github.com/wildmeshing/data.git
        GIT_TAG        d3127d319c99a1af72d2b34eb8f589158d073376
    )
endfunction()