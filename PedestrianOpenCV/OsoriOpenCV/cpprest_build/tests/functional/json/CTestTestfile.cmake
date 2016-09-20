# CMake generated Testfile for 
# Source directory: /Users/hch/cpprestsdk/Release/tests/functional/json
# Build directory: /Users/hch/cpprestsdk/Build_Release/tests/functional/json
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(json_test "/Users/hch/cpprestsdk/Build_Release/Binaries/test_runner" "libjson_test.dylib")
set_tests_properties(json_test PROPERTIES  WORKING_DIRECTORY "/Users/hch/cpprestsdk/Build_Release/Binaries")
