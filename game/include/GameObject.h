#pragma once

#include <string>


namespace CoolGame {
    class GameObject {
    public:
        GameObject(const std::string& name);
        const std::string& getName() const;

    private:
        std::string mName;
    };
}
