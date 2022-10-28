#include "GameObject.h"


namespace CoolGame {
    GameObject::GameObject(const std::string& name) 
    : mName(name)
    {
    }

    const std::string& GameObject::getName() const {
        return mName;
    }
}
