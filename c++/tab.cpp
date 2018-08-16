// Can you read a tab into a char?
#include <iostream>
#include <sstream>
using namespace std;

int main() {
    string input = "\t";
    istringstream iss(input);

    char ch = ' ';
    iss >> ch;
    cout << "Printing | tab |" << endl;
    cout << "|" << ch << "|" << endl;
}
