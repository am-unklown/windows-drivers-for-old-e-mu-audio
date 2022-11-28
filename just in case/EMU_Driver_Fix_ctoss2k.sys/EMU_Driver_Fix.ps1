Get-PnpDevice -FriendlyName "E-MU E-DSP Audio Processor (WDM)" | Disable-PnpDevice -Confirm:$false -Verbose
$FilesToReplace = Import-Csv $PSScriptRoot\FilesToReplace.csv
ForEach ($FiletoReplace in $FilesToReplace) {
    $SourcePath = $PSScriptRoot + "\" + $FileToReplace.SourceFile
    $DestinationPath = $FileToReplace.DestinationPath
    Copy-Item -Path $SourcePath -Destination $DestinationPath -Force -Confirm:$false -Verbose
}
Get-PnpDevice -FriendlyName "E-MU E-DSP Audio Processor (WDM)" | Enable-PnpDevice -Confirm:$false -Verbose