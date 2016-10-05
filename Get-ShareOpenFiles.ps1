$currentsessions = Get-SMBSession
$date = get-date -Format dd-MM-yyyy-hh-mm

ECHO "Path;Computer;User;" > .\$date.csv

foreach ($session in $currentsessions) {
    $openfiles = Get-SMBOpenFile -SessionId $session.SessionId -ErrorAction SilentlyContinue
    foreach ($file in $openfiles) {
        ECHO "$($file.Path);$($file.ClientComputerName);$($file.ClientUserName);" >> .\$date.csv
    }
}