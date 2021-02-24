$env:LC_ALL='C.UTF-8'
[Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8

if ($host.Name -ne 'ConsoleHost') { return; }

Import-Module psreadline
Import-Module posh-git
Import-Module oh-my-posh
Import-Module terminal-icons

. $PSScriptRoot\Functions.ps1

Set-PSReadLineOption -HistoryNoDuplicates -HistorySaveStyle SaveIncrementally -EditMode Emacs -ExtraPromptLineCount 1
@{
	"CTRL+w"="BackwardKillWord";
	"CTRL+Backspace"="BackwardKillLine";
	"Tab"="TabCompleteNext";
	"Shift+Tab"="TabCompletePrevious";
}.GetEnumerator() | ForEach-Object { Set-PSReadlineKeyHandler -chord $_.Key -function $_.Value }

# Alias
@{
	"cd"="Set-Location";
	"edit"="notepad";
	"export"="Export-Environment";
	"gocd"="Get-GoPackage";
	"open"="Invoke-Item";
	"rm"="rm.exe";
}.GetEnumerator() | ForEach-Object { Set-Alias -Option AllScope -Name $_.Key -Value $_.Value }