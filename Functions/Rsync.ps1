function Rsync {
    foreach ($a in $args) {
        if (Test-Path $a) {
            $args[$args.indexOf($a)] = Unix-Path($a)
        }
    }
    bash --login -c "rsync $args" 
}