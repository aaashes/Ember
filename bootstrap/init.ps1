Function pwGen
{
	$pw = RANDOM
	$pw = [System.Text.Encoding]::UTF8.GetBytes($pw.ToString())
	$pw = [System.Convert]::ToBase64String($pw)
	return $pw
}

$uname = $env:USERNAME
$rdir = "c:\Users\$uname\AppData\Roaming\"
$conf = "c:\Users\$uname\AppData\Roaming\Ember\Ember.conf"
$pword = pwGen

echo `t`t'--= [ The Daily Bootstrap // author: ashes ] =--'
echo '[*] Initializing bootstrap...'
Expand-Archive ember-bootstrap.zip -DestinationPath $rdir

echo '[*] Generating configuration file...'
echo rpcusername=Emberrpc > $conf
echo rpcpassword=$pword >> $conf
echo 'addnode=104.236.150.155:10024
addnode=95.183.12.244:3584
addnode=51.255.6.35:30009
addnode=91.200.160.46:11050
addnode=5.135.29.200:10024
addnode=51.255.6.35:10024
addnode=73.9.181.217:18155
addnode=85.175.216.200:10024
addnode=71.87.238.84:10024
addnode=95.183.12.244:10024
addnode=51.255.6.35:10024
addnode=193.90.12.89:58069' >> $conf
echo '[*] Prepped and set.'
echo `n'[Press enter to exit]'
Read-Host