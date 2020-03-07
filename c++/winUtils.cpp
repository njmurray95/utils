#ifndef _WIN32
#error
#endif

#include <string>
#include <Windows.h>

bool processRunning(const std::string& pName)
{
    HWND hwnd = FindWindow(NULL, pName.c_str());
    if (hwnd != 0)
    { 
        return true;
    }
    return false;
}

void display(const std::string& message, const std::string& title="")
{
    MessageBox(NULL, message.c_str(), title.c_str(), MB_OK); 
}
