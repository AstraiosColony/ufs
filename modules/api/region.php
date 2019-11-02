<?php
// UPDATE `visitors` SET `count` = '13' WHERE `visitors`.`id` = 12;
// Configuration settings
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
header( 'Content-type: text/html; charset=utf-8' );
require( "config.php" );

$region = $_REQUEST['region'];
$count = $_REQUEST['count'];
// SQL statments
$findit = "SELECT * FROM `visitors` WHERE `name` LIKE '" . $region . "'";
$result = mysqli_query( $db,$findit );
$isRecord =  mysqli_num_rows( $result );
if ( $isRecord == 0 ) // Is there a record already?
{
   $add = "INSERT INTO `visitors` (, `name`, `count`) VALUES ('" . $region . "','" . $count . "');";
   mysqli_query( $db,$add );
}
else( $isRecord == 1 )
{
    $update = "UPDATE `visitors` SET `count` = '" . $count . "' WHERE `visitors`.`region ` = '". $region . "';";
   mysqli_query( $db,$update );
}
