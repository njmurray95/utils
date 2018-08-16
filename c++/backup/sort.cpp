// Various sort experiments
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

template <typename T>
void print_vec(vector<T> v);

template <typename T>
void print_2D_vec(vector<vector<T>> v);

int main() {

    // Sorting a vector of vectors on the inner vector
    vector<vector<int>> v;
    v.push_back({1, 2, 3, 4});
    v.push_back({6, 5, 4, 3});
    v.push_back({5, 4, 3, 2});
    v.push_back({2, 3, 4, 5});

    print_2D_vec(v);
    sort(v.begin(), v.end());
    print_2D_vec(v);

    // Using a custom sort anon function
    vector<char> v1 = { 'a', 'D', 'e', 'B', 'f', 'C'};
    sort(v1.begin(), v1.end());
    print_vec(v1); // alphabetically
    sort(v1.begin(), v1.end(),
            [](const char &a, const char &b) {
                return toupper(a) < toupper(b);
            });
    print_vec(v1); // alphabetically ignoring case
}

template <typename T>
void print_vec(vector<T> v) {
    for (auto ele : v) {
        cout << ele << " ";
    }
    cout << endl;
}

template <typename T>
void print_2D_vec(vector<vector<T>> v) {
    for (vector<int> vec : v) {
        print_vec(vec);
    }
    cout << endl;
}
