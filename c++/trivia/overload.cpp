/// Testing overloads
#include <iostream>
using namespace std;

class Object {

    private:
        int _datum;

    public:
        Object(int n): _datum(n) {}
        int datum() const { return _datum; }
        int& datum() { _datum++; return _datum; }
};

int main() {
    Object a(5);
    a.datum() = 8;
    cout << a.datum() << endl;
}
