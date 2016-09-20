# CMake generated Testfile for 
# Source directory: /Users/hch/cpprestsdk/Release/tests/functional/uri
# Build directory: /Users/hch/cpprestsdk/Build_Release/tests/functional/uri
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(uri_test "/Users/hch/cpprestsdk/Build_Release/Binaries/test_runner" "liburi_test.dylib")
set_tests_properties(uri_test PROPERTIES  WORKING_DIRECTORY "/Users/hch/cpprestsdk/Build_Release/Binaries")
