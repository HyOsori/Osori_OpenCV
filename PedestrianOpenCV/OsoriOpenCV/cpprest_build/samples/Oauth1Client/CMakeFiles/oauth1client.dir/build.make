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
include samples/Oauth1Client/CMakeFiles/oauth1client.dir/depend.make

# Include the progress variables for this target.
include samples/Oauth1Client/CMakeFiles/oauth1client.dir/progress.make

# Include the compile flags for this target's objects.
include samples/Oauth1Client/CMakeFiles/oauth1client.dir/flags.make

samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o: samples/Oauth1Client/CMakeFiles/oauth1client.dir/flags.make
samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o: /Users/hch/cpprestsdk/Release/samples/Oauth1Client/Oauth1Client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/hch/cpprestsdk/Build_Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o"
	cd /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o -c /Users/hch/cpprestsdk/Release/samples/Oauth1Client/Oauth1Client.cpp

samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/oauth1client.dir/Oauth1Client.cpp.i"
	cd /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/hch/cpprestsdk/Release/samples/Oauth1Client/Oauth1Client.cpp > CMakeFiles/oauth1client.dir/Oauth1Client.cpp.i

samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/oauth1client.dir/Oauth1Client.cpp.s"
	cd /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/hch/cpprestsdk/Release/samples/Oauth1Client/Oauth1Client.cpp -o CMakeFiles/oauth1client.dir/Oauth1Client.cpp.s

samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o.requires:

.PHONY : samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o.requires

samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o.provides: samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o.requires
	$(MAKE) -f samples/Oauth1Client/CMakeFiles/oauth1client.dir/build.make samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o.provides.build
.PHONY : samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o.provides

samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o.provides.build: samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o


samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o: samples/Oauth1Client/CMakeFiles/oauth1client.dir/flags.make
samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o: /Users/hch/cpprestsdk/Release/samples/Oauth1Client/stdafx.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/hch/cpprestsdk/Build_Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o"
	cd /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/oauth1client.dir/stdafx.cpp.o -c /Users/hch/cpprestsdk/Release/samples/Oauth1Client/stdafx.cpp

samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/oauth1client.dir/stdafx.cpp.i"
	cd /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/hch/cpprestsdk/Release/samples/Oauth1Client/stdafx.cpp > CMakeFiles/oauth1client.dir/stdafx.cpp.i

samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/oauth1client.dir/stdafx.cpp.s"
	cd /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/hch/cpprestsdk/Release/samples/Oauth1Client/stdafx.cpp -o CMakeFiles/oauth1client.dir/stdafx.cpp.s

samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o.requires:

.PHONY : samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o.requires

samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o.provides: samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o.requires
	$(MAKE) -f samples/Oauth1Client/CMakeFiles/oauth1client.dir/build.make samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o.provides.build
.PHONY : samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o.provides

samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o.provides.build: samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o


# Object files for target oauth1client
oauth1client_OBJECTS = \
"CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o" \
"CMakeFiles/oauth1client.dir/stdafx.cpp.o"

# External object files for target oauth1client
oauth1client_EXTERNAL_OBJECTS =

Binaries/oauth1client: samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o
Binaries/oauth1client: samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o
Binaries/oauth1client: samples/Oauth1Client/CMakeFiles/oauth1client.dir/build.make
Binaries/oauth1client: Binaries/libcpprest.2.8.dylib
Binaries/oauth1client: /usr/local/lib/libboost_filesystem-mt.dylib
Binaries/oauth1client: /usr/local/lib/libboost_system-mt.dylib
Binaries/oauth1client: /usr/local/lib/libboost_thread-mt.dylib
Binaries/oauth1client: /usr/local/lib/libboost_atomic-mt.dylib
Binaries/oauth1client: /usr/local/lib/libboost_chrono-mt.dylib
Binaries/oauth1client: /usr/local/lib/libboost_random-mt.dylib
Binaries/oauth1client: /usr/local/lib/libboost_regex-mt.dylib
Binaries/oauth1client: /opt/local/lib/libssl.dylib
Binaries/oauth1client: /opt/local/lib/libcrypto.dylib
Binaries/oauth1client: /opt/local/lib/libssl.dylib
Binaries/oauth1client: /opt/local/lib/libcrypto.dylib
Binaries/oauth1client: samples/Oauth1Client/CMakeFiles/oauth1client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/hch/cpprestsdk/Build_Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../Binaries/oauth1client"
	cd /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/oauth1client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
samples/Oauth1Client/CMakeFiles/oauth1client.dir/build: Binaries/oauth1client

.PHONY : samples/Oauth1Client/CMakeFiles/oauth1client.dir/build

samples/Oauth1Client/CMakeFiles/oauth1client.dir/requires: samples/Oauth1Client/CMakeFiles/oauth1client.dir/Oauth1Client.cpp.o.requires
samples/Oauth1Client/CMakeFiles/oauth1client.dir/requires: samples/Oauth1Client/CMakeFiles/oauth1client.dir/stdafx.cpp.o.requires

.PHONY : samples/Oauth1Client/CMakeFiles/oauth1client.dir/requires

samples/Oauth1Client/CMakeFiles/oauth1client.dir/clean:
	cd /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client && $(CMAKE_COMMAND) -P CMakeFiles/oauth1client.dir/cmake_clean.cmake
.PHONY : samples/Oauth1Client/CMakeFiles/oauth1client.dir/clean

samples/Oauth1Client/CMakeFiles/oauth1client.dir/depend:
	cd /Users/hch/cpprestsdk/Build_Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/hch/cpprestsdk/Release /Users/hch/cpprestsdk/Release/samples/Oauth1Client /Users/hch/cpprestsdk/Build_Release /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client /Users/hch/cpprestsdk/Build_Release/samples/Oauth1Client/CMakeFiles/oauth1client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : samples/Oauth1Client/CMakeFiles/oauth1client.dir/depend

