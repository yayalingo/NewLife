Write-Host ----------------------ENUMERATION SCRIPT --------------------------
Write-Host ---------------Local Enumeration for: $env:COMPUTERNAME----------------
Write-Host -------------------------------------------------------------------

Get-ComputerInfo CsDNSHostname.CsDomain,OsName,OsVersion,OsBuildNumber,OsHotFixes,WindowsVersion,BiosSMBIOSBIOSVersion

write-host -----installed software:
Get-WmiObject win32_product | Select-Object Name,Version,packetname,installdate | format-table

Write-Host -----installed anti-virus:
Get-CimInstance -Namespace root/SecurityCenter -ClassName AntiVirusProduct

Write-Host ----windows defender info:
Get-MpComputerStatus

net users
net local group

Write-Host -----done!!