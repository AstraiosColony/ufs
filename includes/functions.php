<?php

function customError($errno, $errstr) {
  echo "<b>Error:</b> [$errno] $errstr";
}
/**
 * Gets Statistics from the Second Life XML Api
 *
 * @param string $request Which Statistic To Return, Default Grid Status
 */

function GetSLstats($request) {
$slapi=simplexml_load_file("http://secondlife.com/xmlhttp/secondlife.php") or die("Error: Cannot create object");

if($request == "status"){
echo $slapi->status;
}
elseif($request == "signups"){
echo $slapi->signups;
}
elseif($request == "logged_in_last_60"){
echo $slapi->logged_in_last_60;
}
elseif($request == "transactions"){
echo $slapi->transactions;
}
elseif($request == "inworld"){
echo $slapi->inworld;
}
else{
echo"Error : Invalid Request Parameter";
}
}


/**
 * Displays a Alert using CSS
 *
 * @param string $type The Type of Alert, Determines Color, Accepts success,info,warning,danger
 * @param string $message The Message to be Displayed
 * @param string $code Error Code to be displayed, this is optional
 */

function DisplayAlert($type,$message, $code = ""){
if($type == "success"){
echo"<div class='alert alert-success' role='alert'>";
echo "<strong>" . $code . "</strong>";
echo $message;
echo "</div>";
}
elseif($type == "info"){
echo"<div class='alert alert-info' role='alert'>";
echo "<strong>" . $code . "</strong>";
echo $message;
echo "</div>";
}
elseif($type == "warning"){
echo"<div class='alert alert-warning' role='alert'>";
echo "<strong>" . $code . "</strong>";
echo $message;
echo "</div>";
}
elseif($type == "danger"){
echo"<div class='alert alert-danger' role='alert'>";
echo "<strong>" . $code . "</strong>";
echo $message;
echo "</div>";
}
else{
echo"Error: Invalid Type Passed to DisplayAlert()";
}
}


function MaintenanceModeEnabled($true){
	if($true == TRUE){
	include"error-page/maintenance.php";
	die();
}
else{}
}

function GetUserDivision($did){
        $db = $GLOBALS['db'];
	$sql = "SELECT * FROM divisions WHERE did='"  . $did . " ' ";
	$result= mysqli_query($db,$sql);
	
        while($row = mysqli_fetch_array($result)){
	echo $row['dname'];
        }

	
}

function GetUserRank($rank_id){
        $db = $GLOBALS['db'];
	$sql = "SELECT * FROM rank WHERE RankID='"  . $rank_id . " ' ";
	$result= mysqli_query($db,$sql);
	
        while($row = mysqli_fetch_array($result)){
	echo $row['rname'];
        }

	
}

/**
 * Retrieves Title by Reading The Title Associated with TID
 *
 * @param string $tid The TID of the User
 * 
 */


function GetUserTitle($tid){
        $db = $GLOBALS['db'];
	$sql = "SELECT * FROM titles WHERE tid='"  . $tid . " ' ";
	$result= mysqli_query($db,$sql);
	
        while($row = mysqli_fetch_array($result)){
	echo $row['tag_name'];
        }

	
}


?>

