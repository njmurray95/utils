# PowerShell Profile
#
# Powershell looks for this file wherever $Profile is set
# i.e., $profile, nvim $Profile, Test-Path $Profile, etc.

Set-Location C:\Users\nmurray\code

Function prompt {
    # Change the window-title to show PWD
    $host.ui.RawUI.WindowTitle = $(get-location)

    # Default PS Prompt
    # from: (get-childitem -path Function:\prompt).scriptblock
    "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
}
