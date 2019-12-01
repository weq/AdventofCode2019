$numbers = (Import-PowerShellDataFile -Path $PSScriptRoot\input.psd1).numbers
$dorp = @()
foreach ($number in $numbers) {
    $fuel = [math]::floor($number/3) - 2
    $totalFuel = @()
    $totalFuel += $fuel
    While ($fuel -gt 0) {
        [decimal]$fuel = ([math]::floor($fuel/3) - 2)
        if (-not ($fuel -lt 0)) {
            $totalFuel += $fuel
        }
    }
    $dorp += ($totalFuel | Measure-Object -Sum).sum
}
"Puzzle 2 solution: " + ($dorp | Measure-Object -Sum).sum