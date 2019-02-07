#ifndef _WIN32
#error
#endif

#include <Windows.h>

bool processRunning(const LPCSTR procName)
{
    HWND hwnd = FindWindow(NULL, pName);
    if (hwnd != 0)
    { 
        return true;
    }
    return false;
}
