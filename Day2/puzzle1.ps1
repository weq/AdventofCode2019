# Day 2 Puzzle 1
# https://adventofcode.com/2019/day/2/input
$numbers = @(1,9,10,3,2,3,11,0,99,30,40,50)
$numbers = (Import-PowerShellDataFile -Path $PSScriptRoot\input.psd1).numbers
$numbers[1] = 12
$numbers[2] = 2
$newNumbers = $numbers
$step = 0
$areWeThereYet = $true
While ($areWeThereYet) {
    $startInstruction = $newNumbers[0+$step]
    $firstNumber = $newNumbers[1+$step]
    $secondNumber   = $newNumbers[2+$step]
    $savePosition  = $newNumbers[3+$step]
    if ($startInstruction -eq 1) {
        $valueToBeSaved = $newNumbers[$firstNumber] + $newNumbers[$secondNumber]
        $newNumbers[$savePosition] = $valueToBeSaved
    }
    if ($startInstruction -eq 2) {
        $valueToBeSaved = $newNumbers[$firstNumber] * $newNumbers[$secondNumber]
        $newNumbers[$savePosition] = $valueToBeSaved 
    } elseif ($startInstruction -eq 99) {
        $areWeThereYet = $false
    }
    $step += 4
}
Write-Host "Puzzle 1 solution: $($newNumbers[0])"