# PSReadline Options
if ($host.Name -eq 'ConsoleHost') { 
    Import-Module "PSReadline" 
    Set-PSReadLineOption -HistoryNoDuplicates -HistorySaveStyle SaveIncrementally -EditMode Emacs
    $bindings = @{"CTRL+w"="BackwardKillWord";"CTRL+Backspace"="BackwardKillLine";"Tab"="TabCompleteNext";"Shift+Tab"="TabCompletePrevious";}
    $bindings.Keys | ForEach-Object {
            Set-PSReadlineKeyHandler -chord $_ -function $bindings.Item($_) #
    }
}

# Load every file in Functions
$profile + "\..\Functions" | Get-ChildItem | ForEach-Object {. $_.FullName }

# Alias
Set-Alias -Name "Edit" -Value "notepad"
