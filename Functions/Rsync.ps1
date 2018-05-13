function Rsync {
    foreach ($a in $args) {
        if (Test-Path $a) {
            $args[$args.indexOf($a)] = Get-UnixPath($a)
        }
    }
    bash --login -c "rsync $args" 
}