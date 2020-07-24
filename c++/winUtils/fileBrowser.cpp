#ifndef _WIN32
#error
#endif

#include <string>
#include <Windows.h>

// Requires build with comdlg32.lib
#include <commdlg.h>

std::string openFileBrowser(const std::string dir)
{
    // Struct for file browser info
    // Consult for option information: https://docs.microsoft.com/en-us/windows/win32/api/commdlg/ns-commdlg-openfilenamea
    OPENFILENAME ofn;
    char szFile[100];
    ZeroMemory( &ofn , sizeof( ofn));

    ofn.lStructSize = sizeof ( ofn );
    ofn.hwndOwner = NULL  ;
    ofn.lpstrFile = szFile ;
    ofn.lpstrFile[0] = '\0';
    ofn.nMaxFile = sizeof( szFile );
    ofn.lpstrFilter = "All\0*.*\0Text\0*.TXT\0";
    ofn.nFilterIndex =1;
    ofn.lpstrFileTitle = NULL ;
    ofn.nMaxFileTitle = 0 ;
    ofn.lpstrInitialDir= dirname.c_str();
    ofn.Flags = OFN_PATHMUSTEXIST|OFN_FILEMUSTEXIST ;
    ofn.lpstrTitle = "Title";
    
    GetOpenFileName( &ofn );

    return std::string(ofn.lpstrFile);
}

int main()
{
    return 0;
}
