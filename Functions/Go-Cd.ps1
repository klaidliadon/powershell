function Get-GoPackage { 
    $target = ($env:GOPATH + "\src\" + ${args}[0]).replace("/", "\")
    if (!(Test-Path $target)) {
        throw [System.Exception] ("Package "+${args}[0]+" not found")
    }
    Push-Location $target
}

Set-Alias -Name "gocd" -Value "Get-GoPackage"