
<?php
include"config.php";
global $db;
include"includes/functions.php";
/// Database Start
require"includes/class.database.php";
$database = Database::getInstance();
$db = $database->getConnection(); 
//// Session
require"includes/class.session.php";
$session = new Session;
$session->make_shit();


require"includes/class.staff.php";
$staff = new Staff;



include"includes/class.profile.php";

include"includes/class.smartbots.php";

include"includes/permissions.php";
include"includes/header.php";
include"includes/sidebar.php";



?>

