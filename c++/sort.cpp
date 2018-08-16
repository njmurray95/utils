// Various sort experiments
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

// Print vectors
template <typename T>
ostream& operator<< (ostream& out, vector<T>& v) {
    for (auto ele : v) out << ele << " ";
    out << endl;
    return out;
}

int main() {

    // Sorting a vector of vectors on the inner vector
    vector<vector<int>> v;
    v.push_back({1, 2, 3, 4});
    v.push_back({6, 5, 4, 3});
    v.push_back({5, 4, 3, 2});
    v.push_back({2, 3, 4, 5});

    cout << v;
    sort(v.begin(), v.end());
    cout << v;

    // Using a custom sort anon function
    vector<char> v1 = { 'a', 'D', 'e', 'B', 'f', 'C'};
    sort(v1.begin(), v1.end());
    cout << v1; // alphabetically
    sort(v1.begin(), v1.end(),
            [](const char &a, const char &b) {
                return toupper(a) < toupper(b);
            });
    cout << v1; // alphabetically ignoring case
}
