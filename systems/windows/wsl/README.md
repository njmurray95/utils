# Windows Subsystem for Linux (WSL)

## Set Admin Password

For specific wsl instance:
```
C:\> [ubuntu|kali|...] config --default-user root
C:\> ubuntu
$ password <USER>
C:\> ubuntu config --default-user <USER>
```

For wsl in general:
```
PS C:> wsl -u root
$ passwd
```
