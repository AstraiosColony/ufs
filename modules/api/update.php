<?php
header('Content-type: text/html; charset=utf-8');
include("config.php");
mysqli_set_charset($db, "utf8");
//    ini_set('default_charset', 'UTF-8');
$uuid  = $_REQUEST['uuid'];
$info = $_REQUEST['update'];
$value = $_REQUEST['value'];
$error = "\n\nFailed to update Group Tag.\nContact Astraios Colony Engineering with the provided Error Message\n";

if($info = "division")
{
$sql = "UPDATE `accounts` SET `DivID` = '" . $value . "' WHERE `accounts`.`UUID` = '". $uuid . "';";


}

if (mysqli_query($db, $sql)) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . mysqli_error($db);
}








?>
