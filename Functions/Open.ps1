function Open { 
    if ($args.Count -eq 0 ) { 
        $args = @(".")
    }
    if ((Get-Item $args[0]).Attributes -eq "Directory") {
        explorer $args 
    } else {
        & $args[0]
    }
}
