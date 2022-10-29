#!/bin/bash

Help()
{
   # Display Help
   echo "The script generates CMake build directory and execute Make to build different targets based on the arguments."
   echo
   echo "Syntax: build -t <test|game|all> -d <build_dir> -b <Debug|Release>"
   echo "options:"
   echo "-t                Defines the target binary to build (test|game|all)."
   echo "-d                Specifies the build folder name where to generate CMake files." 
   echo "                  CAUTION: If it exists, it will be deleted."
   echo "-b                Specifies the build type (Debug | Release)."
   echo "-h                Shows help"
   echo
}

# List of available build targets and their mapping
declare -A BUILD_TARGETS_ARRAY=(
 [all]=all  [game]=CoolestGame_run  [test]=CoolestGame_lib
)

# Get the options
while getopts ":h:t:d:b:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      t) # Set target binary to build (all | game | test)
         if [[ -n "${BUILD_TARGETS_ARRAY[$OPTARG]}" ]]; then
            BUILD_TARGET=${BUILD_TARGETS_ARRAY[${OPTARG}]}
            echo "- Building ${BUILD_TARGET} target(s)."
         else
            Help
            echo "Error: Invalid build target. Expected: 'game', 'test' or 'all'"
            echo ${OPTARG}
            exit
         fi;;
      d) # Set build directory
         if [ -z "${BUILD_DIR}" ]; then
            BUILD_DIR=${OPTARG}
            echo "- Building project in: ${BUILD_DIR}"
         else
            Help
            echo "Error: Missing build folder, please make sure to specify one."
            exit
         fi;;
      b) # Set the build type (Debug | Release)
         if [ "$OPTARG" = Debug ] || [ "$OPTARG" = Release ]; then
               BUILD_TYPE=$OPTARG;
               echo "- Build type is set to: ${BUILD_TYPE}"
         else
               Help
               echo "Error: Invalid build type. Expected: 'Debug', 'Release'"
               exit
         fi;;
     \?) # Invalid option
         Help
         echo "Error: Invalid option"
         exit;;
   esac
done

if [[ ! -v BUILD_TYPE || ! -v BUILD_TARGET || ! -v BUILD_DIR ]]; then
      Help
      echo "Error: Invalid or missing arguments"
      exit;
   else

      # If the build folder already exists it will be deleted and reset.
      if [ -d "${BUILD_DIR}" ]; then rm -Rf ${BUILD_DIR}; fi
      mkdir ${BUILD_DIR} && cd ${BUILD_DIR}

      echo "- Starting CMake.."
      cmake .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -G "Unix Makefiles"

      echo "- Building.."
      make ${BUILD_TARGET}
fi
