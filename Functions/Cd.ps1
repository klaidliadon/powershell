Remove-Item alias:cd -force
function Cd($target) {
    switch ($target) {
        ""  { return Push-Location "~" }
        "-" { return Pop-Location }
        Default { 
            if ([System.IO.File]::Exists("$target.lnk")) {  $target = "$target.lnk" }
            if ($target.EndsWith(".lnk")) { $target = Get-TargetPath($target) }
            return Push-Location $target 
        }
    }
}