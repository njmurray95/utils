# Terminal and Shells

> A computer terminal is an electronic or electromechanical hardware device that is used for entering data into, and displaying or printing data from, a computer or a computing system.

> -- Wikipedia: https://en.wikipedia.org/wiki/Computer_terminal

The terminal and the shell program it runs are almost as old as the computer. Over time great variety.

## Clipboard Access

|                      | Setup                | Copy                 |  Paste                | Notes                |
|:--------------------:|:--------------------:|:--------------------:|:---------------------:|:--------------------:|
| Bash                 | pacman install xclip | echo "" | xclip      | xclip                 | ---                  |
| Powershell           | ---                  | Set-Clipboard        | Get-Clipboard         | ---                  |
|Windows Command Prompt| ---                  | ---                  | ---                   | ---                  |
| Cygwin               | ---                  |echo "" | /dev/clipboard| cat /dev/clipboard    | ---                  |

