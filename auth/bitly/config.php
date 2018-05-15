
<?php

//// Database Settings
$DB_SERVER="localhost";
$DB_USERNAME="root";
$DB_PASSWORD="65%tWb19s7Zp";
$DB_DATABASE="orbital";
$DB_PORT = "3306";
$db = mysqli_connect($DB_SERVER, $DB_USERNAME, $DB_PASSWORD,$DB_DATABASE, $DB_PORT);
if(mysqli_connect_errno()) { die('Database Connection Error - ' . mysqli_connect_error()); }




?>

