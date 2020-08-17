# Chocolatey

> The Package Manager for Windows

> -- Chocolatey Homepage: https://chocolatey.org

## Installation

The instructions at the website are clear enough: https://chocolatey.org/install

Open a PowerShell session and enter the following command (which will download Chocotey's install script and run it):

```
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

This requires that Powershell's Execution Policy (`Get-ExecutionPolicy`) tolerates running scripts. (See `Get-Help about_execution_policies`).

If Chocolatey refuses to install, first run this:

```
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
```

(The Chocolatey docs will actually recommend the scope `Bypass` which would enable all scripts for the present session -- not really needed here.)
