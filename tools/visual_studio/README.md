# Visual Studio (Code)

> Visual Studio Code is a source-code editor developed by Microsoft for Windows, Linux and macOS.[6] It includes support for debugging, embedded Git control and GitHub, syntax highlighting, intelligent code completion, snippets, and code refactoring.

> -- Wikipedia

## Files

Config files (see here: https://code.visualstudio.com/docs/getstarted/settings):

* Windows: `%APPDATA%\Code\User\settings.json`
* macOS: `$HOME/Library/Application Support/Code/User/settings.json`
* Linux: `$HOME/.config/Code/User/settings.json`

VS will automatically reload any saved settings file, no need to do much beyond write some settings out and type.

The `settings.json` file has support for many vim plugins built-in:

```
{
  "vim.surround": true,
  "vim.useSystemClipboard": true
}
```
