function Load-Environment($file) {
	foreach ($i in $(Get-Content -Path $file) -split '["\n\r"|"\r\n"|\n|\r]'){
		if (!$i) {
			continue
		}
		$parts = $i.split("=")
        [Environment]::SetEnvironmentVariable($parts[0], $ExecutionContext.InvokeCommand.ExpandString($parts[1]), "Process")
	}
}