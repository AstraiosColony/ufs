<?php



class Courses 
{

	public function Display_Courses()
	{
		

echo"<div class='row'>";
 echo"<div class='col-lg-12'>";
 echo"<div class='panel panel-default'>";
 echo"<div class='panel-heading'>";
 echo"United Federation Starfleet Course Listing";
 echo"</div>";
 echo"<!-- /.panel-heading -->";
echo" <div class='panel-body'>";
 echo"<table width='100%' class='table table-striped table-bordered table-hover' id='dataTables-course-listing'>";
 echo"<thead>";
 echo"<tr>";
 echo"<th>Department</th>";
 echo"<th>Class Name</th>";
 echo"<th>Class Description</th>";
 echo"<th>Minimum Score</th>";
 echo"</tr>";
 echo"</thead>";
 echo"<tbody>";
$stuff = $this->Query_Courses();
foreach( $stuff as $row )
{
    
    echo "<tr class='gradeC'><td>" . $row['dname'] . "</td><td>" . $row['Class Name'] . "</td><td>" . $row['Class Description'] . "</td><td>" . $row['Required Score'] . "</td></tr>";
}



 echo"</tbody>";
 echo"</table>";
 echo"<!-- /.table-responsive -->";
 echo"<div class='well'>";
 echo"<h4>Disclaimer</h4>";
 echo"<p>The Information in this Table may not always be up to date, for official purposes, reference the Official Course Listing on the UFS Database</p>";
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


	public function Query_Courses()
	{
	global $db;
	$result = mysqli_query( $db,"SELECT d.`dname`, c.`Class Name`, c.`Class Description`, c.`Required Score` FROM `courses` c INNER JOIN `divisions` d ON c.DivID=d.did ORDER BY c.`Class Name`" );


	return $result;

	}



}



?>