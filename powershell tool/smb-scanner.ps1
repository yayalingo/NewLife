param($ip_network,$ip_range)

#$ip_network = "10.224.127."
#$ip_range = 1..14

$ping = New-Object System.Net.NetworkInformation.Ping

$result = $ip_range | foreach {$ping.Send("$ip_network$_",1000)} |Select-Object address,status
$live_hosts = $result | Where-Object {$_.status -eq "success"}

Foreach($target in $live_hosts)
{
    $dns_name = Resolve-DnsName $target.address 2>$null
    (net view $dns_name.NameHost) 2>$null
    }
