// Data structure that takes in variable types
// Similar to python lists
#include <iostream>     // ostream
#include <vector>
#include <typeinfo>     // typeid
using namespace std;

class Data {

    void *data;

    public:

    template<typename T>
    Data (T t) {
        data = &t;
        cout << typeid(t).name() << endl;
    }

    /*
    template<typename T, typename U>
    friend ostream& operator<< (ostream& out, const Data &d) {
        out << *(T*)d.data << endl;
        return out;
    }
    */
};

/*
template<typename T>
ostream& operator<< (ostream& out, const Data<T> &d) {
    out << *(T*)d.data << endl;
    return out;
}
*/

/*
class Varlist {

    void *data;

    public:

    template<typename T>
    Varlist (T t) {
        data = &t;
    }

    friend ostream& operator<< (ostream& out, Varlist v);

};

ostream& operator<< (ostream& out, Varlist v) {
    out << *(char*)v.data << endl;
    return out;
}
*/

int main() {

    Data x(5);
    Data y('a');
    //Varlist v('a');
    //cout << v;
    //decltype(5) x;
    //x = 6;
    //cout << x << endl;
}
