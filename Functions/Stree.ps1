function STree($path){
    $path = (Resolve-Path $path).toString()
    if (!(Test-Path "$path\.git")) {
        throw [System.Exception] ("Not a git repository")
    }
    Start-Process "SourceTree.exe"  -ArgumentList "-f $path"
}
