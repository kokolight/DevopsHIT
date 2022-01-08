$hostname = $args[0]
$port = $args[1]
if(!$hostname -or !$port)
{
    Write-Host "Missing parameters!"
    exit 1
}

$isAvailable = Test-NetConnection -ComputerName $hostname -Port $port

if($isAvailable.TcpTestSucceeded)
{
    Write-Host "Succeeded"
    exit 0
}

Write-Host "Failed"
exit 1