param($port_range,$ip_network,$ip_range)
$tcp_client = New-Object System.Net.Sockets.TcpClient
$tcp_client.SendTimeout = 10

#$port_range = 20..26
#$ip_network = "192.168.153."
#$ip_range = 1..255

foreach($host_ip in $ip_range)
{
    $current_ip = "$ip_network$host_ip"
    write-host "Scanning Host:$current_ip"
    $port_range | ForEach-Object {echo($tcp_client.connect($current_ip,$_)) "port $_ is open!"} 2>$null
}