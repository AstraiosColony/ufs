<?php
require"config.php";
 
$name = htmlspecialchars($_GET['name']);
$object = htmlspecialchars($_GET['object']);
$key = htmlspecialchars($_GET['key']);
$ip = $_SERVER['REMOTE_ADDR'];
$ref = $_SERVER['HTTP_REFERER'];
$dtime = date('r');
if($ref == ""){
   $ref = "None";
}
if($name == ""){
   $name = "anon";
}


// prepare and bind
$sql = "INSERT INTO visitors (name, object, key, ip, ref, date) VALUES" .  $name . "," . $object . "," . $key . "," . $ip . "," . $ref . "," . $dtime;

if (mysqli_query($db, $sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $mysqli_error;
}
exit("Welcome to SS Pathfinder Research Facility, All Interactions from this Point are In character");
?>