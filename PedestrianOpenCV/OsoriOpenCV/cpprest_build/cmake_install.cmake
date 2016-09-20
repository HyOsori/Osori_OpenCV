# Install script for directory: /Users/hch/cpprestsdk/Release

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cpprest" TYPE FILE FILES
    "/Users/hch/cpprestsdk/Release/include/cpprest/astreambuf.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/asyncrt_utils.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/base_uri.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/containerstream.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/filestream.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/http_client.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/http_headers.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/http_listener.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/http_msg.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/interopstream.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/json.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/oauth1.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/oauth2.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/producerconsumerstream.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/rawptrstream.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/streams.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/uri.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/uri_builder.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/version.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/ws_client.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/ws_msg.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pplx" TYPE FILE FILES
    "/Users/hch/cpprestsdk/Release/include/pplx/pplx.h"
    "/Users/hch/cpprestsdk/Release/include/pplx/pplxcancellation_token.h"
    "/Users/hch/cpprestsdk/Release/include/pplx/pplxconv.h"
    "/Users/hch/cpprestsdk/Release/include/pplx/pplxinterface.h"
    "/Users/hch/cpprestsdk/Release/include/pplx/pplxlinux.h"
    "/Users/hch/cpprestsdk/Release/include/pplx/pplxtasks.h"
    "/Users/hch/cpprestsdk/Release/include/pplx/pplxwin.h"
    "/Users/hch/cpprestsdk/Release/include/pplx/threadpool.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cpprest/details" TYPE FILE FILES
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/SafeInt3.hpp"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/basic_types.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/cpprest_compat.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/fileio.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/http_client_impl.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/http_helpers.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/http_server.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/http_server_api.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/http_server_asio.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/http_server_httpsys.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/nosal.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/resource.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/uri_parser.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/web_utilities.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/x509_cert_utilities.h"
    "/Users/hch/cpprestsdk/Release/include/cpprest/details/http_constants.dat"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/hch/cpprestsdk/Build_Release/src/cmake_install.cmake")
  include("/Users/hch/cpprestsdk/Build_Release/tests/cmake_install.cmake")
  include("/Users/hch/cpprestsdk/Build_Release/samples/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/hch/cpprestsdk/Build_Release/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
