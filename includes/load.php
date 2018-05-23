<?php
require $_SERVER['DOCUMENT_ROOT'] . "/includes/config.php";
require $_SERVER['DOCUMENT_ROOT'] . "/includes/class.database.php";
$database = Database::getInstance();
$db = $database->getConnection(); 

//// Session
require $_SERVER['DOCUMENT_ROOT']. "/includes/class.session.php";
$session = new Session;
$session->make_shit();


require $_SERVER['DOCUMENT_ROOT'] . "/includes/class.staff.php";
$staff = new Staff;

require $_SERVER['DOCUMENT_ROOT'] . "/includes/class.courses.php";
$courses = new Courses;


require $_SERVER['DOCUMENT_ROOT'] . "/includes/class.grades.php";
$grades = new Grades;


require $_SERVER['DOCUMENT_ROOT'] . "/includes/class.data.php";
$data = new Data;


require $_SERVER['DOCUMENT_ROOT'] . "/includes/class.staff-list.php";
$staff_list = new Staff_Directory;


require $_SERVER['DOCUMENT_ROOT'] . "/includes/header.php";
require $_SERVER['DOCUMENT_ROOT'] . "/includes/sidebar.php";
?>