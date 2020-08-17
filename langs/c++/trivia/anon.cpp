// testing anonymous namespaces
#include <iostream>

int bar() {
    return 5;
}

namespace foo {
    int bar() {
        return 6;
    }
}

int main() {
    // 5
    std::cout << bar() << std::endl;
    // 5
    std::cout << ::bar() << std::endl;
    // 6
    std::cout << foo::bar() << std::endl;
}
