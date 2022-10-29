cmake_minimum_required( VERSION 3.10 )

project( CoolestGame )

set( CMAKE_CXX_STANDARD 14 )

# Set names for Static Library and Executable files
set( GAME_BINARY ${CMAKE_PROJECT_NAME}_run )
set( GAME_TEST_BINARY ${CMAKE_PROJECT_NAME}_test )
set( GAME_LIBRARY ${CMAKE_PROJECT_NAME}_lib )

# Include directories
include_directories(
    game/include
    dependencies/googletest/include
)

add_subdirectory( game )
add_subdirectory( game/test )
add_subdirectory( dependencies/googletest )