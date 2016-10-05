$currentsessions = Get-SMBSession
$date = Get-Date
$outputobject = @()

foreach $session in $currentsessions {
	$openfiles = Get-SMBOpenFile -SessionId $session.SessionId
    $outputobject += $openfiles
}

Export-CSV -Delimiter ";" -InputObject $outputobject -Path $date.csv