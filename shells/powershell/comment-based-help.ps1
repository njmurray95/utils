<#
.SYNOPSIS
    Example of how PowerShell Comment-based help works.

.DESCRIPTION
    Uses some console writes on ranges to demonstrate PowerShell Comment-based help.

.PARAMETER LowerBound
    The lower bound of the range to print.

.PARAMETER UpperBound
    The upper bound of the range to print.

.EXAMPLE
    Basic example.
    PS C:\> .\comment-based-help.ps1
    1 2 3 4 5 6 7 8 9 10

.EXAMPLE
    Advanced example.
    PS C:\> .\comment-based-help.ps1 -LowerBound 5 -UpperBound 8
    5 6 7 8
#>

Param
(
    [Int]$LowerBound = 1,
    [Int]$UpperBound = 10
)

Write-Host (${LowerBound}..${UpperBound})
