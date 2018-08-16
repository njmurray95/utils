// More fun with templates (see preproc.cpp)
#include <iostream>
using namespace std;

// choose(n, r) implementation
template<unsigned n, unsigned r>
struct Choose {
    static const long long value = n * Choose<n-1, r-1>::value / r;
};

template<unsigned n>
struct Choose<n, 0> {
    static const int value = 1;
};

int main() {

    // Template values are known at compile-time
    cout << Choose<5, 3>::value << endl;

    int arr[Choose<6, 2>::value];

}

