function Generate-Markov{
    [cmdletbinding()]
    param (
        [Parameter(Mandatory=$true, Position = 0)]
        [String]$in
    )
    $testArray = $in -split '\s+'
    $q = New-Object System.Collections.Queue
    for($i = 0; $i -lt $testArray.Count-2; $i++){
        $global:markov2["$($testArray[$i])|$($testArray[$i+1])"] += , $testArray[$i+2]
        $global:markov1["$($testArray[$i])"] += , $testArray[$i+1]
    }
}
<#
$global:markov2 = @{}
$global:markov1 = @{}

$testString = Get-Content 'C:\Users\playn_000\Documents\StefanBot\jeeves.txt'
$testString = ($testString | Out-String) -replace '\r\n', ' ' -replace '[\"\-\*\,\;\:]', ' ' -replace '[\'']', '' -split '[\.\?\!]' | % {$_.Trim()}
$testString = $testString.ToLower()
$testString | ? {[bool]$_} | % {Generate-Markov $_}

1..100 | % {$line = @($markov1.Keys | Get-Random)} {
$line += if($markov2[$line[-1]].Count -ge 3)
{($markov2[$line[-1]] | Get-Random)}
else{($markov1[$line[-1]] | Get-Random)}
} {$line -join ' '}

#>

$token = Get-Content 'C:\Users\playn_000\Documents\StefanBot\discord_token.txt'