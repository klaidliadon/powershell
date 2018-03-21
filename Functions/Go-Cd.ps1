function Go-Cd { 
    $target = ($env:GOPATH + "\src\" + ${args}[0]).replace("/", "\")
    if (![System.IO.Directory]::Exists($target)) {
        Write-Host "Package " -NoNewline
        Write-Host $args[0] -NoNewline -ForegroundColor Red
        Write-Host " does not exits!"
        return
    }
    Set-Location $target
}
