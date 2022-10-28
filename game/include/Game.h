#pragma once

#include "GameObject.h"

#include <vector>


namespace CoolGame {
    class Game {
        public:
            void addGameObject(const std::string& name);
        private:
            std::vector<GameObject> mGameObjects;
    };
}
