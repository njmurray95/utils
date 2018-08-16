#include <iostream>
#include <ctime>
#include <typeinfo>
using namespace std;

int main() {
    srand(time(0));
    int x = rand() % 10;
    cout << "Int: " << typeid(2).name() << endl;
    cout << "Double: " << typeid(1.5).name() << endl;
    // Always double
    cout << "Conditional: " << typeid(x < 5 ? 2 : 1.5).name() << endl;
}
