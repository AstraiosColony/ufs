<?php
require"config.php";
session_start();

$code = $_REQUEST['code'];

$_SESSION["bitly_oauth"] = $code;
// prepare and bind
$stmt = $db->prepare("INSERT INTO oauth (username, bitly) VALUES (?, ?)");
$stmt->bind_param("ss", $username, $bitly);


$username = $_SESSION["username"];
$bitly = $code;
$stmt->execute();


$stmt->close();
$db->close();

header('Location: $return_to');
?>
