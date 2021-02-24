$user = $env:USERNAME;
$hostname = (Get-Culture).TextInfo.ToTitleCase("$ENV:COMPUTERNAME".toLower());

$GitPromptSettings.BranchColor.ForegroundColor = 'Orange';
$GitPromptSettings.DefaultPromptPrefix.Text = ''
$GitPromptSettings.DefaultPromptPath.Text = ''
$GitPromptSettings.DefaultPromptSuffix.Text = '`n> '
$GitPromptSettings.PathStatusSeparator = ''
$GitPromptSettings.BeforeStatus = '['
$GitPromptSettings.AfterStatus = ']'

function Prompt {
	$prompt += Write-Prompt "["
	$prompt += Write-Prompt $(Get-Date -Format "HH:mm:ss") -ForegroundColor Gray
	$prompt += Write-Prompt "]["
	$prompt += Write-Prompt $user -ForegroundColor Blue
	$prompt += Write-Prompt "@"
	$prompt += Write-Prompt $hostname -ForegroundColor Cyan
	$prompt += Write-Prompt "] "
	$prompt += Write-Prompt $pwd -ForegroundColor Yellow
	$prompt += Write-Prompt " "
	$prompt += & $GitPromptScriptBlock
	return $prompt
}

function Get-TargetPath {
	Param(
		[Parameter(Mandatory=$true)][string]$linkPath
   	)
	return $(new-object -com wscript.shell).CreateShortcut($(resolve-path $target)).TargetPath
}

function Set-Location($target) {
	if (!$target) {
		return Push-Location "~"
	}
	if ($target -eq "-") {
		return Pop-Location
	}
	if ([System.IO.File]::Exists("$target.lnk")) {
		$target = "$target.lnk" 
	}
	if ($target.EndsWith(".lnk")) {
		$target = Get-TargetPath($target)
	}
	return Push-Location $target 
}

function Export-Environment {
	[CmdletBinding()]
	Param([Parameter(ValueFromPipeline)] [string[]] $items )
	BEGIN {}
    PROCESS {
		if (!$items) {
			$items = $args
		}
		foreach ($i in $items)	{
			if (!$i) {
				continue
			}
			$parts = $i.split("=",2)
			[Environment]::SetEnvironmentVariable($parts[0], $ExecutionContext.InvokeCommand.ExpandString($parts[1]), "Process")
		}
	}
    END {}
}
