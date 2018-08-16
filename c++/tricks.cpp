// Coolest tricks of cpp
#include <iostream>
using namespace std;

int main() {

    // String index trick to print a square
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 5; ++j) {
            cout << "*" << " \n"[j==4];
        }
    }

}
