#include <iostream>
#include <cstdlib>
using namespace std;

class Test {

    public:

    int x;

    Test() : x(rand()) {}

    void change() {
        Test* ptr = new Test();
        this = ptr;
    }

};

ostream& operator<< (ostream& out, Test t) {
    out << t.x << endl;
    return out;
}

int main() {
    Test t;

}
