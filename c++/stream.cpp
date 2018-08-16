#include <iostream>
#include <iterator>                 // output_iterator
#include <vector>
using namespace std;

int main() {

    ostream_iterator <int> outiter(cout, "\n");
    vector<int> v = { 1, 2, 3, 4, 5 };
    copy(v.begin(), v.end(), outiter);
}
