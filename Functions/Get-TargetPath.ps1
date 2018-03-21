function Get-TargetPath {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$linkPath
   )
    return $(new-object -com wscript.shell).CreateShortcut($(resolve-path $target)).TargetPath
}