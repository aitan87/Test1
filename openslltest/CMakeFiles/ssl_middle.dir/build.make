# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /snap/cmake/283/bin/cmake

# The command to remove a file.
RM = /snap/cmake/283/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aitan/code/openslltest

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aitan/code/openslltest

# Include any dependencies generated for this target.
include CMakeFiles/ssl_middle.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ssl_middle.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ssl_middle.dir/flags.make

CMakeFiles/ssl_middle.dir/src/ssl_middle.c.o: CMakeFiles/ssl_middle.dir/flags.make
CMakeFiles/ssl_middle.dir/src/ssl_middle.c.o: src/ssl_middle.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aitan/code/openslltest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ssl_middle.dir/src/ssl_middle.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ssl_middle.dir/src/ssl_middle.c.o   -c /home/aitan/code/openslltest/src/ssl_middle.c

CMakeFiles/ssl_middle.dir/src/ssl_middle.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ssl_middle.dir/src/ssl_middle.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/aitan/code/openslltest/src/ssl_middle.c > CMakeFiles/ssl_middle.dir/src/ssl_middle.c.i

CMakeFiles/ssl_middle.dir/src/ssl_middle.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ssl_middle.dir/src/ssl_middle.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/aitan/code/openslltest/src/ssl_middle.c -o CMakeFiles/ssl_middle.dir/src/ssl_middle.c.s

# Object files for target ssl_middle
ssl_middle_OBJECTS = \
"CMakeFiles/ssl_middle.dir/src/ssl_middle.c.o"

# External object files for target ssl_middle
ssl_middle_EXTERNAL_OBJECTS =

bin/ssl_middle: CMakeFiles/ssl_middle.dir/src/ssl_middle.c.o
bin/ssl_middle: CMakeFiles/ssl_middle.dir/build.make
bin/ssl_middle: CMakeFiles/ssl_middle.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/aitan/code/openslltest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin/ssl_middle"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ssl_middle.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ssl_middle.dir/build: bin/ssl_middle

.PHONY : CMakeFiles/ssl_middle.dir/build

CMakeFiles/ssl_middle.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ssl_middle.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ssl_middle.dir/clean

CMakeFiles/ssl_middle.dir/depend:
	cd /home/aitan/code/openslltest && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aitan/code/openslltest /home/aitan/code/openslltest /home/aitan/code/openslltest /home/aitan/code/openslltest /home/aitan/code/openslltest/CMakeFiles/ssl_middle.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ssl_middle.dir/depend

