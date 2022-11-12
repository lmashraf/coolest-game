cmake_minimum_required( VERSION 3.10 )

project( CoolestGame )

set( CMAKE_CXX_STANDARD 14 )

# Set names for Static Library and Executable files
set( GAME_BINARY ${CMAKE_PROJECT_NAME}_run )
set( GAME_TEST_BINARY ${CMAKE_PROJECT_NAME}_test )
set( GAME_LIBRARY ${CMAKE_PROJECT_NAME}_lib )

# Add googletest Dependency
include(FetchContent)
message( STATUS "Fetching googletest ...")
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.8.0
)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
set(BUILD_GMOCK OFF CACHE BOOL "" FORCE)
set(BUILD_GTEST ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# Include directories
include_directories(
    game/include
)

add_subdirectory( game )
add_subdirectory( test )