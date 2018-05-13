function Get-VSEnv() {
    Push-Location 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build'    
    cmd /c "vcvars64.bat&set" |
        foreach {
        if ($_ -match "=") {
            $v = $_.split("="); 
            set-item -force -path "ENV:\$($v[0])" -value "$($v[1])"
        }
    }
    Pop-Location
    write-host "`nVisual Studio 2017 Command Prompt variables set." -ForegroundColor Yellow

}