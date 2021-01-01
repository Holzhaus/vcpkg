vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/acoustid/chromaprint/releases/download/v1.5.0/chromaprint-1.5.0.tar.gz"
    FILENAME "chromaprint-1.5.0.tar.gz"
    SHA512 25ab3f7834581a8204ac09614fef6036c801f5f8b7b72a864701ca0de8082b2458a2bd7c075d53451581d770898576411cdcfb23ce609bc82f9d9b395cc1a129
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

# Remove debug/include directory
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/chromaprint RENAME copyright)
