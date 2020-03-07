#include <iostream>
using namespace std;

class Test {

    public:
    int x = 0;

    Test(){};
    Test(int t) : x{t} {};
};

int main() {
    Test test1{};
    Test test2{5};
    cout << test1.x << endl;
    cout << test2.x << endl;
}
