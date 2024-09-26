# Duplicate the behavior of Windows scripts that pause
Function Pause {
  Write-Host -NoNewLine 'Press any key to continue...';
  $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}
