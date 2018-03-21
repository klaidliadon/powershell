function Set-Audio { 
    nircmdc setdefaultsounddevice $args[0] 1 
    nircmdc setdefaultsounddevice $args[0] 2
}