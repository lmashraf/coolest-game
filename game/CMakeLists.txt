################## BUILD ################## 
# Get the game sources
file( 
        GLOB_RECURSE GAME_SOURCES 
        main.cpp 
        ${CMAKE_CURRENT_SOURCE_DIR}/src/common/*.cpp
)

# Get sources needed to run the tests and to export them as a static library
file( 
        GLOB_RECURSE LIB_SOURCES 
        ${CMAKE_CURRENT_SOURCE_DIR}/src/common/*.cpp 
)

# Create executable from the game sources
add_executable( ${GAME_BINARY} ${GAME_SOURCES} )

# Create a static library to include the code into the unit tests
add_library( ${GAME_LIBRARY} STATIC ${LIB_SOURCES} )