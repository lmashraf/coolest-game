#include "GameObject.h"

#include <gtest/gtest.h>

TEST(GameObjectTest, CreateObject)
{
	CoolGame::GameObject gameObject("Hello World");
	ASSERT_EQ(gameObject.getName(), "Hello World");	
}

TEST(GameObjectTest, FailTest)
{
	ASSERT_EQ(false, true);
}

