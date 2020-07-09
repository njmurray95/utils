#ifndef _WIN32
#error
#endif

#include <string>
#include <Windows.h>

// Launch subprocess
// Equivalent to fork + exec
void fork(const std::string& command)
{
    
    // Process overhead
    STARTUPINFO si;
    PROCESS_INFORMATION pi;

    ZeroMemory( &si, sizeof(si) );
    si.cb = sizeof(si);
    ZeroMemory( &pi, sizeof(pi) );

    // Launch process
    // See: https://docs.microsoft.com/en-us/windows/win32/procthread/creating-processes
    CreateProcess(NULL, const_cast<char*>(command.c_str()),
                  NULL, NULL, FALSE, 0, NULL, NULL,
                  &si, &pi);
}

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
