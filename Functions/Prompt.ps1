function Prompt {
    $color = if ($? -eq $True) { "Green" } else { "Red" }
    $host.UI.RawUI.WindowTitle = "$ENV:USERNAME@$ENV:COMPUTERNAME - $(Get-Location)"
    Write-Host "[" -NoNewline 
    Write-Host (Get-Date -Format "HH:mm:ss") -NoNewline -ForegroundColor $color
    Write-Host "][" -NoNewline 
    Write-Host "$ENV:USERNAME" -NoNewline -ForegroundColor Cyan
    Write-Host "@" -NoNewline 
    Write-Host (Get-Culture).TextInfo.ToTitleCase("$ENV:COMPUTERNAME".toLower()) -NoNewline -ForegroundColor Blue
    Write-Host "] " -NoNewline 
    Write-Host $(pwd).Path.replace($HOME, "~") -ForegroundColor Yellow
    if (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Host "#" -NoNewline -ForegroundColor Red
    }
    else {  
        Write-Host ">" -NoNewline -ForegroundColor Gray
    }
    return " "
}

