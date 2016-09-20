# CMake generated Testfile for 
# Source directory: /Users/hch/cpprestsdk/Release/tests/functional/streams
# Build directory: /Users/hch/cpprestsdk/Build_Release/tests/functional/streams
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(streams_test "/Users/hch/cpprestsdk/Build_Release/Binaries/test_runner" "libstreams_test.dylib")
set_tests_properties(streams_test PROPERTIES  WORKING_DIRECTORY "/Users/hch/cpprestsdk/Build_Release/Binaries")
