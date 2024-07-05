param($ip_network,$ip_range)

#$ip_network = "10.224.127."
#$ip_range = 1..255

$ping =  New-Object System.Net.NetworkInformation.Ping
$ip_range | foreach-object {$ping.Send("$ip_network$_",1000)} | Select-Object address,status   #1000ms 