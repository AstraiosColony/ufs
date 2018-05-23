<?php



class Records
{

	public function Display_Records()
	{
		

echo"<div class='row'>";
 echo"<div class='col-lg-12'>";
 echo"<div class='panel panel-default'>";
 echo"<div class='panel-heading'>";
 echo"United Federation Starfleet Academy Records Listing";
 echo"</div>";
 echo"<!-- /.panel-heading -->";
echo" <div class='panel-body'>";
 echo"<table width='100%' class='table table-striped table-bordered table-hover' id='dataTables-course-listing'>";
 echo"<thead>";
 echo"<tr>";
 echo"<th>Department</th>";
 echo"<th>Class Name</th>";
 echo"</tr>";
 echo"</thead>";
 echo"<tbody>";
$stuff = $this->Query_Records();
foreach( $stuff as $row )
{
    //Creates a loop to loop through results
    echo "<option>" . $row['ClassID'] . " ". $row['Class Name'] . "</option>";
}


 echo"</tbody>";
 echo"</table>";
 echo"<!-- /.table-responsive -->";
 echo"<div class='well'>";
 echo"<h4>Disclaimer</h4>";
 echo"<p>The Information in this Table may not always be up to date, for official purposes, reference the Official Listing on the UFS Database</p>";
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


	public function Query_Records()
	{
	global $db;
	$result = mysqli_query( $db,"SELECT `ClassID`,`Class Name`  FROM `courses`" );


	return $result;

	}



}



?>
