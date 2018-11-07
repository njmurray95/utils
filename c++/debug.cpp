// debug.cpp
// Tricks for debugging c++ code

#include <fstream>

// Sloppy binary dump for objects in most formats
// Will only work with statically-sized objects
template <typename DataTypeT>
void writeBinary(const DataTypeT& obj, std::string filename)
{
    std::ofstream out(filename);
    out.write((char*) &obj, sizeof(DataTypeT));
}



int main()
{

}
