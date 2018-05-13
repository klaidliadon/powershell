function Get-UnixPath($path) {
    $parts = (Resolve-Path (Join-Path $pwd $path)) -split ":"
    return "/mnt/" + $parts[0].ToLower() + $parts[1].replace("\", "/")
}