#include <iostream>
using namespace std;

int main(){
    int x = 3;
    {
        int x = x;
        cout << x;
    }
}
