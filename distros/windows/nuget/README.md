# Nuget

>  NuGet is the package manager for .NET. The NuGet client tools provide the ability to produce and consume packages. The NuGet Gallery is the central package repository used by all package authors and consumers. 
>
> -- https://www.nuget.org/

* Source: https://www.nuget.org/downloads
* Docs: https://docs.microsoft.com/en-us/nuget/

Nuget is probably the easiest way to manage/install system packages (such as libpng or libcurl) on Windows. 

## Warnings

<Common pratfalls, issues, non-obvious concerns, if any>

## Installation

Download one of the packages from the web source. To install programmitcally, run this command in a PowerShell session:

```
Invoke-WebRequest "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile "nuget.exe"
```

## Files

N/A

## Use

Then to install a given package run this (or similar):

```
.\nuget install <PACKAGE> -OutputDirectory .\nuget-packages
```

