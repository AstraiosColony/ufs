<?php

 
require $include . "/includes/config.php";
require $include . "/includes/class.database.php";
$database = Database::getInstance();
$db = $database->getConnection(); 

//// Session
require $include . "/includes/class.session.php";
$session = new Session;
$session->make_shit();


require $include . "/includes/class.staff.php";
$staff = new Staff;

require $include . "/includes/class.courses.php";
$courses = new Courses;


require $include . "/includes/class.grades.php";
$grades = new Grades;


require $include . "/includes/class.data.php";
$data = new Data;


require $include . "/includes/class.staff-list.php";
$staff_list = new Staff_Directory;


require $include  . "/includes/header.php";
require $include . "/includes/sidebar.php";
?>
