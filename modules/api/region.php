<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require( "config.php" );

$region = $_REQUEST['region'];
$count = $_REQUEST['count'];
// SQL statments
$findit = "SELECT * FROM `visitors` WHERE `name` LIKE '" . $region . "'";
$result = mysqli_query( $db,$findit );
 $update = "UPDATE `visitors` SET `count` = '" . $count . "' WHERE `visitors`.`region ` = '". $region . "'";
$isRecord =  mysqli_num_rows( $result );
   $add = "INSERT INTO `visitors` (, `name`, `count`) VALUES ('" . $region . "','" . $count . "')";
if ( $isRecord == 0 ) // Is there a record already?
{

   
   mysqli_query( $db,$add );
}
else( $isRecord == 1 )
{
  
   mysqli_query( $db,$update );
}

echo $findit;
echo "\n";
echo $update;
echo "\n";
echo $add;
