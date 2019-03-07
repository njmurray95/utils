// Utils for c++ language features -- variadic types, templates, etc.

#include <iostream>
using namespace std;

void print() { cout << endl; }; // base case
// Print arbitrary number of objects
// Requires object have operator<< defined
template<typename T, typename... args>
void print(T x, args... y) {
    cout << x << " ";
    print(y...);
}

int main() {
    print(5, "a", 3.14, "hello world");
}
