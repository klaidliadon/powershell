function Get-IP($interface, $family) {
    return (Get-NetIPAddress -InterfaceAlias $interface -AddressFamily $family).IPAddress;
}