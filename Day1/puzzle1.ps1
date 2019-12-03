# Day 1 Puzzle 1
$numbers = (Import-PowerShellDataFile -Path $PSScriptRoot\input.psd1).numbers
$dorp = @()
foreach($number in $numbers) {
    $dorp += [math]::floor($number/3) - (2)
}
"Puzzle 1 solution: " + ($dorp | Measure-Object -Sum).sum