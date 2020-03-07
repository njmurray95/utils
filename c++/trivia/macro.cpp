#include <iostream>
using namespace std;

// Variable debug print -- only when compiled with -DDEBUG
#ifndef DEBUG
#define watch(x)
#else
#define watch(x) cout << (#x) << " is " << (x) << endl;
#endif

int main() {
    int x = 5;
    watch(x)
}
