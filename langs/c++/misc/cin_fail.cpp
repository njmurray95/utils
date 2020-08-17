#include <iostream>
#include <sstream>
using namespace std;

int main() {

    string input = "ab 15 42";
    istringstream iss(input);
    int x = 5, y = 4;
    char ch = ' ';

    cout << "x: " << x << " y: " << y << endl;
    cout << (iss >> ch) << endl;
    cout << (iss >> x) << endl;
    cout << (iss >> y) << endl;
    cout << "x: " << x << " y: " << y << endl;

    iss.clear();
    cout << (iss >> y) << endl;
    cout << "x: " << x << " y: " << y << endl;
}
