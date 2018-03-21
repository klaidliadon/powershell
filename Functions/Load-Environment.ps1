function Load-Environment($file) {
	foreach ($i in $(Get-Content -Path $file) -split '["\n\r"|"\r\n"|\n|\r]'){
		$parts = $i.split("=")
		[Environment]::SetEnvironmentVariable($parts[0], $parts[1], "Process")
	}
}