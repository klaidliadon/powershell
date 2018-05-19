function Open { 
    if ($args.Count -eq 0 ) { 
        $args = @(".")
    }
    if ((Get-Item $args[0]) -is [System.IO.DirectoryInfo]) {
        explorer $args 
    } else {
        & $args[0]
    }
}
