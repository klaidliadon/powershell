Remove-Item alias:cd -force
function Cd($target) {
    if ($target -eq "-") {
        $target = $global:old
    }
    if (!$target) {
        $target = ""
    }
    if (![System.IO.File]::Exists("$target") -and [System.IO.File]::Exists("$target.lnk")) {
        $target = "$target.lnk"
    }
    if ($target.EndsWith(".lnk")) {
        $target = Get-TargetPath($target)
    }
    $global:old = $PWD.Path 
    Set-Location($target)
}