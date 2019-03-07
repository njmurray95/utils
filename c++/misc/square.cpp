// String index trick to print a square
#include <iostream>

int main() {
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 5; ++j) {
            std::cout << "*" << " \n"[j==4];
        }
    }
}
