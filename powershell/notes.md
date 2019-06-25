# Powershell

## Variables

```
PS C:\> set-variable -name "name" -value "value"
PS C:\> echo $name
value
```

```
PS C:\> set-variable -name "one" -value "1"
PS C:\> set-variable -name "two" -value "2"
PS C:\> get-variable one, two

Name                           Value
----                           -----
one                            1
two                            2


PS C:>
```

Environment variables:
```
PS C:\> $env:APPDATA
```

## Making a file

```
PS C:\> new-item -path "test.txt" -value "hello world"


    Directory: C:\


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        5/17/2019  10:07 AM             11 test.txt


PS C:\> get-content -path test.txt
hello world
PS C:\> "test" > test.txt
PS C:\> cat test.txt
test
PS C:\> remove-item test.txt
```

## Help Commands

### Get-Help

```
PS C:\> Get-Help -name [program name]
```

Reference:
```
PS C:\> Get-Help -name Get-Help
```

Examples:
```
PS C:\> Get-Help -name Get-Process -examples
```

Full technical information:
```
PS C:\> Get-Help -name Get-Process -Full
```

### Get-Command

List all available system commands:
```
PS C:\> Get-Command
```

Verify if command exists:
```
PS C:\> Get-Command Get-Process

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Get-Process                                        3.1.0.0    Microsoft.PowerShell.Management


PS C:\> Get-Command kjkj
Get-Command : The term 'kjkj' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the
spelling of the name, or if a path was included, verify that the path is correct and try again.
At line:1 char:1
+ Get-Command kjkj
+ ~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (kjkj:String) [Get-Command], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException,Microsoft.PowerShell.Commands.GetCommandCommand

PS C:\>
```

Consult syntax:
```
PS C:\> Get-Command Get-Process -Syntax

Get-Process [[-Name] <string[]>] [-ComputerName <string[]>] [-Module] [-FileVersionInfo] [<CommonParameters>]

Get-Process [[-Name] <string[]>] -IncludeUserName [<CommonParameters>]

Get-Process -Id <int[]> -IncludeUserName [<CommonParameters>]

Get-Process -Id <int[]> [-ComputerName <string[]>] [-Module] [-FileVersionInfo] [<CommonParameters>]

Get-Process -InputObject <Process[]> -IncludeUserName [<CommonParameters>]

Get-Process -InputObject <Process[]> [-ComputerName <string[]>] [-Module] [-FileVersionInfo] [<CommonParameters>]

PS C:\>
```

## Debugging

Set breakpoints from CMDLine:
```
PS C:\>Set-PSBreakpoint -Line 5 -Script ./test.ps1
```

Running that script will create a breakpoint on line 5:
```
[DBG]: PS C:\>> ?

 s, stepInto         Single step (step into functions, scripts, etc.)
 v, stepOver         Step to next statement (step over functions, scripts, etc.)
 o, stepOut          Step out of the current function, script, etc.

 c, continue         Continue operation
 q, quit             Stop operation and exit the debugger
 d, detach           Continue operation and detach the debugger.

 k, Get-PSCallStack  Display call stack

 l, list             List source code for the current script.
                     Use "list" to start from the current line, "list <m>"
                     to start from line <m>, and "list <m> <n>" to list <n>
                     lines starting from line <m>

 <enter>             Repeat last command if it was stepInto, stepOver or list

 ?, h                displays this help message.


For instructions about how to customize your debugger prompt, type "help about_prompt".

[DBG]: PS C:\>>
```

Clear breakpoints if any:
```
PS C:\> Get-PSBreakpoint | Remove-PSBreakpoint
```

## Tricks

* `Clear-Host`: Clear screen (= Linux <C-l>)
* Get Version: $PSVersionTable.PSVersion
