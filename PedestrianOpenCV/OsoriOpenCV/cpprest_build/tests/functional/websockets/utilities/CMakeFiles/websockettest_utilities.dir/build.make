# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/local/bin/cmake

# The command to remove a file.
RM = /opt/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/hch/cpprestsdk/Release

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/hch/cpprestsdk/Build_Release

# Include any dependencies generated for this target.
include tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/depend.make

# Include the progress variables for this target.
include tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/progress.make

# Include the compile flags for this target's objects.
include tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/flags.make

tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o: tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/flags.make
tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o: /Users/hch/cpprestsdk/Release/tests/functional/websockets/utilities/test_websocket_server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/hch/cpprestsdk/Build_Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o"
	cd /Users/hch/cpprestsdk/Build_Release/tests/functional/websockets/utilities && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o -c /Users/hch/cpprestsdk/Release/tests/functional/websockets/utilities/test_websocket_server.cpp

tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.i"
	cd /Users/hch/cpprestsdk/Build_Release/tests/functional/websockets/utilities && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/hch/cpprestsdk/Release/tests/functional/websockets/utilities/test_websocket_server.cpp > CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.i

tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.s"
	cd /Users/hch/cpprestsdk/Build_Release/tests/functional/websockets/utilities && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/hch/cpprestsdk/Release/tests/functional/websockets/utilities/test_websocket_server.cpp -o CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.s

tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o.requires:

.PHONY : tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o.requires

tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o.provides: tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o.requires
	$(MAKE) -f tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/build.make tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o.provides.build
.PHONY : tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o.provides

tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o.provides.build: tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o


# Object files for target websockettest_utilities
websockettest_utilities_OBJECTS = \
"CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o"

# External object files for target websockettest_utilities
websockettest_utilities_EXTERNAL_OBJECTS =

Binaries/libwebsockettest_utilities.dylib: tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o
Binaries/libwebsockettest_utilities.dylib: tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/build.make
Binaries/libwebsockettest_utilities.dylib: Binaries/libcommon_utilities.dylib
Binaries/libwebsockettest_utilities.dylib: Binaries/libcpprest.2.8.dylib
Binaries/libwebsockettest_utilities.dylib: /usr/local/lib/libboost_filesystem-mt.dylib
Binaries/libwebsockettest_utilities.dylib: /usr/local/lib/libboost_system-mt.dylib
Binaries/libwebsockettest_utilities.dylib: /usr/local/lib/libboost_thread-mt.dylib
Binaries/libwebsockettest_utilities.dylib: /usr/local/lib/libboost_atomic-mt.dylib
Binaries/libwebsockettest_utilities.dylib: /usr/local/lib/libboost_chrono-mt.dylib
Binaries/libwebsockettest_utilities.dylib: /usr/local/lib/libboost_random-mt.dylib
Binaries/libwebsockettest_utilities.dylib: /usr/local/lib/libboost_regex-mt.dylib
Binaries/libwebsockettest_utilities.dylib: Binaries/libunittestpp.dylib
Binaries/libwebsockettest_utilities.dylib: /opt/local/lib/libssl.dylib
Binaries/libwebsockettest_utilities.dylib: /opt/local/lib/libcrypto.dylib
Binaries/libwebsockettest_utilities.dylib: /opt/local/lib/libssl.dylib
Binaries/libwebsockettest_utilities.dylib: /opt/local/lib/libcrypto.dylib
Binaries/libwebsockettest_utilities.dylib: tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/hch/cpprestsdk/Build_Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../../../../Binaries/libwebsockettest_utilities.dylib"
	cd /Users/hch/cpprestsdk/Build_Release/tests/functional/websockets/utilities && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/websockettest_utilities.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/build: Binaries/libwebsockettest_utilities.dylib

.PHONY : tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/build

tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/requires: tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/test_websocket_server.cpp.o.requires

.PHONY : tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/requires

tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/clean:
	cd /Users/hch/cpprestsdk/Build_Release/tests/functional/websockets/utilities && $(CMAKE_COMMAND) -P CMakeFiles/websockettest_utilities.dir/cmake_clean.cmake
.PHONY : tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/clean

tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/depend:
	cd /Users/hch/cpprestsdk/Build_Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/hch/cpprestsdk/Release /Users/hch/cpprestsdk/Release/tests/functional/websockets/utilities /Users/hch/cpprestsdk/Build_Release /Users/hch/cpprestsdk/Build_Release/tests/functional/websockets/utilities /Users/hch/cpprestsdk/Build_Release/tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/functional/websockets/utilities/CMakeFiles/websockettest_utilities.dir/depend
