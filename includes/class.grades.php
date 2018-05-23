<?php



class Grades
{

	public function Display_Grades()
	{
		

echo"<div class='row'>";
 echo"<div class='col-lg-12'>";
 echo"<div class='panel panel-default'>";
 echo"<div class='panel-heading'>";
 echo"United Federation Starfleet Academy Grade Listing";
 echo"</div>";
 echo"<!-- /.panel-heading -->";
echo" <div class='panel-body'>";
 echo"<table width='100%' class='table table-striped table-bordered table-hover' id='dataTables-course-listing'>";
 echo"<thead>";
 echo"<tr>";
 echo"<th>Name</th>";
 echo"<th>Course</th>";
 echo"<th>Grade</th>";
 echo"</tr>";
 echo"</thead>";
 echo"<tbody>";
$stuff = $this->Query_Grades();
foreach( $stuff as $row )
{
    //Creates a loop to loop through results
    echo "<tr><td>" . $row['DisplayName'] . "</td><td>" . $row['Class Name'] . "</td><td align='right'>" . $row['Grade'] . "</td></tr>";
}


 echo"</tbody>";
 echo"</table>";
 echo"<!-- /.table-responsive -->";
 echo"<div class='well'>";
 echo"<h4>Disclaimer</h4>";
 echo"<p>The Information in this Table may not always be up to date, for official purposes, reference the Official Listings on the UFS Database</p>";
 echo"</div>";
 echo"</div>";
 echo"<!-- /.panel-body -->";
 echo"</div>";
 echo"<!-- /.panel -->";
 echo"</div>";
 echo"<!-- /.col-lg-12 -->";
 echo"</div>";
 echo"<!-- /.row -->";

	}


	public function Query_Grades()
	{
	global $db;
	$result = mysqli_query( $db,"SELECT a.`DisplayName`, c.`Class Name`, g.`Grade` FROM `accounts` a INNER JOIN `gradebook` g ON g.`StudentID` = a.`ID` INNER JOIN `courses` c   ON c.`ClassID` = g.`CourseID` INNER JOIN `divisions` d ON c.`DivID` = d.`did` ORDER BY a.`DisplayName`" );

	return $result;

	}



}



?>
