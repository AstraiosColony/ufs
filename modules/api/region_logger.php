<?php
require"config.php";

$method = $dil = $fps = $region = $server = "";

$method = $_POST['method'];
$dil = $_POST['dil'];
$fps = $_POST['fps'];
$region = $_POST['region'];
$server = $_POST['server'];
 
if ($method=="")
{
    die("Error : No Method provided!");
}
 
if ($region=="")
{
    die("result = No region provided!");
    //alerts script in SL not to send any data any more and to inform the owner about this damn error... :)
} else {
    $region = str_replace(" ","_",$region);
    $RRDFILE = $path.$region."_dilfps.rrd";
    $RRDFILE_ping = $path.$region."_ping.rrd";
}
 
echo ("result = $server");
$resultping = shell_exec("/bin/ping $server -c 1");
$var1 = strpos($resultping, "time=");
$ping = trim((substr($resultping,$var1+5,3)));
 
 
if ($method=="set")
{
 
    //write data into rrd's
 
    $ret = exec("/usr/bin/rrdtool update $RRDFILE -t dil:fps N:$dil:$fps");
        if( $ret1 != 0 )
        {
            die ("result = ERROR occurred");
        }
//    echo "result = /usr/bin/rrdtool update $RRDFILE -t dil:fps N:$dil:$fps";
 
    $ret = exec("/usr/bin/rrdtool update $RRDFILE_ping -t ping N:$ping");
        if( $ret2 != 0 )
        {
            die ("result = ERROR occurred");
        }
//    echo ("result = /usr/bin/rrdtool update $RRDFILE_ping -t ping N:$ping");
//echo ("result = $ping");
 
}
?>