# PowerShell Profile
#
# Powershell looks for this file wherever $Profile is set
# i.e., $profile, nvim $Profile, Test-Path $Profile, etc.
#
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.1

Set-Location C:\Users\nmurray\code

Function prompt {
    # Change the window-title to show PWD
    $host.ui.RawUI.WindowTitle = $(get-location)

    # Default PS Prompt
    # from: (get-childitem -path Function:\prompt).scriptblock
    "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
}
