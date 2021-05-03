# Resource Hacker

>  ... a freeware resource compiler & decompiler for Windows® applications 
>
> -- http://www.angusj.com/resourcehacker/

The resource hacker is a good way to modify Windows file properties -- add version info, change icons, dialog boxes, and other such metadata often accessed through a right-click or two. (These are things Windows considers under the label "resource compiler".)

# Examples

### Add version info to a file

Start with some `.rc` file with the desired properties:

versioninfo.rc:
```
1 VERSIONINFO
FILEVERSION 1,0,0,0
PRODUCTVERSION 1,0,0,0
FILEOS 0x40004
FILETYPE 0x1
{
BLOCK "StringFileInfo"
{
    BLOCK "040904B0"
    {
        VALUE "FileDescription", "DESCRIPTION"
        VALUE "InternalName", "INTERNAL NAME"
        VALUE "OriginalFilename", "FILENAME"
        VALUE "CompanyName", "COMPANY NAME"
        VALUE "LegalCopyright", "\xA9 ETC."
        VALUE "ProductName", "PRODUCT NAME"
        VALUE "FileVersion", "1.1.3.0"
        VALUE "ProductVersion", "1.1.3.0"
    }
}

BLOCK "VarFileInfo"
{
    VALUE "Translation", 0x0409 0x04B0
}
}

```

Then use RH to convert this into a `.res` resource file:

```
resourcehacker.exe  -open versioninfo.rc -save versioninfo.res -action compile
```

The binary `.res` resource file can then be added directly to the exe:

```
resourcehacker.exe -open prog.exe -save prog.exe -action addoverwrite -resource versioninfo.res
```