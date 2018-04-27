function Prompt {
	$data = @{
		color = if ($LastExitCode -eq 0 -or $? -eq $True) { "Green" } else { "Red" };
		user = $env:USERNAME;
		hostname = (Get-Culture).TextInfo.ToTitleCase("$ENV:COMPUTERNAME".toLower());
		location = $(pwd).Path.replace($HOME, "~");
        date = (Get-Date -Format "HH:mm:ss");
        admin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator");
	}
	$host.UI.RawUI.WindowTitle = $data.user+"@"+$data.hostname+" - "+$data.location
	Write-Host "[" -NoNewline 
	Write-Host $data.date -NoNewline -ForegroundColor $data.color
	Write-Host "][" -NoNewline 
	Write-Host $data.user -NoNewline -ForegroundColor Cyan
	Write-Host "@" -NoNewline 
	Write-Host $data.hostname -NoNewline -ForegroundColor Blue
	Write-Host "] " -NoNewline 
	Write-Host $data.location -ForegroundColor Yellow
	if ($data.admin) {
		Write-Host "#" -NoNewline -ForegroundColor Red
	} else {  
		Write-Host ">" -NoNewline -ForegroundColor Gray
	}
	return " "
}