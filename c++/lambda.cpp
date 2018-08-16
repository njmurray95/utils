// lambdas in cpp

#include <iostream>
#include <functional>
using namespace std;

int main() {

    // Example void lambda
    void (*func_ptr)(int) = [](int x) { cout << x << endl; };
    func_ptr(5);

    // Example int lambda
    int (*add_one)(int) = [](int x) { return x + 1; };
    cout << add_one(5) << endl;
}
