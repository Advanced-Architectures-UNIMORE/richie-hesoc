# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

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
CMAKE_COMMAND = /usr/scratch/badile14/gbellocchi/workspace_pulp/hero/install/bin/cmake

# The command to remove a file.
RM = /usr/scratch/badile14/gbellocchi/workspace_pulp/hero/install/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/build

# Include any dependencies generated for this target.
include CMakeFiles/ref_app.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ref_app.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ref_app.dir/flags.make

CMakeFiles/ref_app.dir/src/main.c.o: CMakeFiles/ref_app.dir/flags.make
CMakeFiles/ref_app.dir/src/main.c.o: ../src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ref_app.dir/src/main.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ref_app.dir/src/main.c.o   -c /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/src/main.c

CMakeFiles/ref_app.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ref_app.dir/src/main.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/src/main.c > CMakeFiles/ref_app.dir/src/main.c.i

CMakeFiles/ref_app.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ref_app.dir/src/main.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/src/main.c -o CMakeFiles/ref_app.dir/src/main.c.s

CMakeFiles/ref_app.dir/src/main.c.o.requires:

.PHONY : CMakeFiles/ref_app.dir/src/main.c.o.requires

CMakeFiles/ref_app.dir/src/main.c.o.provides: CMakeFiles/ref_app.dir/src/main.c.o.requires
	$(MAKE) -f CMakeFiles/ref_app.dir/build.make CMakeFiles/ref_app.dir/src/main.c.o.provides.build
.PHONY : CMakeFiles/ref_app.dir/src/main.c.o.provides

CMakeFiles/ref_app.dir/src/main.c.o.provides.build: CMakeFiles/ref_app.dir/src/main.c.o


# Object files for target ref_app
ref_app_OBJECTS = \
"CMakeFiles/ref_app.dir/src/main.c.o"

# External object files for target ref_app
ref_app_EXTERNAL_OBJECTS =

ref_app: CMakeFiles/ref_app.dir/src/main.c.o
ref_app: CMakeFiles/ref_app.dir/build.make
ref_app: libLibsModule.a
ref_app: CMakeFiles/ref_app.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ref_app"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ref_app.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ref_app.dir/build: ref_app

.PHONY : CMakeFiles/ref_app.dir/build

CMakeFiles/ref_app.dir/requires: CMakeFiles/ref_app.dir/src/main.c.o.requires

.PHONY : CMakeFiles/ref_app.dir/requires

CMakeFiles/ref_app.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ref_app.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ref_app.dir/clean

CMakeFiles/ref_app.dir/depend:
	cd /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/build /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/build /scratch2/gbellocchi/ethz/arov/ov_cfg/asap_test_traffic/test/sw/inc/stim/hwpe_cl0_lic3/ref_sw/build/CMakeFiles/ref_app.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ref_app.dir/depend

