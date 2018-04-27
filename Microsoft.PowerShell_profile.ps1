# PSReadline Options
if ($host.Name -eq 'ConsoleHost') { Import-Module "PSReadline" }
Set-PSReadlineOption -EditMode "Emacs"
Set-PSReadLineOption -HistoryNoDuplicates 
Set-PSReadlineKeyHandler -Key "Tab" -Function "Complete"
Set-PSReadlineKeyHandler -chord "ctrl+w" -function "BackwardKillWord"
Set-PSReadlineKeyHandler -chord "ctrl+backspace" -function "BackwardKillLine"

# Load every file in Functions
foreach ($file in ls (Join-Path (Get-Item $profile).Directory "Functions")) {
	. ($file| Select-Object FullName).FullName
}

# Alias
Set-Alias -Name "Edit" -Value "notepad"

