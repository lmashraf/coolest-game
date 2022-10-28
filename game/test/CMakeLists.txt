################## TEST ################## 
add_executable( ${GAME_TEST_BINARY} test_GameObject.cpp )

add_test( NAME ${GAME_TEST_BINARY} COMMAND ${GAME_TEST_BINARY})

target_link_libraries( 
    ${GAME_TEST_BINARY} PUBLIC 
    ${CMAKE_PROJECT_NAME}_lib 
    gtest 
    gtest_main
)