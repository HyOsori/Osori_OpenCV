# CMake generated Testfile for 
# Source directory: /Users/hch/cpprestsdk/Release/tests/functional/http/listener
# Build directory: /Users/hch/cpprestsdk/Build_Release/tests/functional/http/listener
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(httplistener_test "/Users/hch/cpprestsdk/Build_Release/Binaries/test_runner" "libhttplistener_test.dylib")
set_tests_properties(httplistener_test PROPERTIES  WORKING_DIRECTORY "/Users/hch/cpprestsdk/Build_Release/Binaries")
