#include <iostream>
#include <ctime>
#include <typeinfo>
using namespace std;

int main() {

    // typeid
    srand(time(0));
    int x = rand() % 10;
    // Always 'i'
    cout << "Int: " << typeid(2).name() << endl;
    // Always 'd'
    cout << "Double: " << typeid(1.5).name() << endl;
    // Always 'd' because the expression gets cast to type double
    cout << "Conditional: " << typeid(x < 5 ? 2 : 1.5).name() << endl;
}
