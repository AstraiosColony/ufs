<?php
$page_title = "Rank Marks ";
include"load.php";


?>


		 <div id="page-wrapper" class="gray-bg dashbard-1">
       <div class="content-main">
 
 	<!--banner-->	
		     <div class="banner">
		    	<h2>
				<a href="index.php">Home</a>

			
				</h2>
		    </div>
		<!--//banner-->

 	<div class="blank">
	

			<div class="blank-page">
				
<?php
mysqli_set_charset( $db,"utf8" );

?>
                                        <table class="outline">
                                                    <tr class="box">
                                                                <th>Rank Name</th>
                                                                <th>Rank Logo</th>
                                                                </tr>
                                                                <?php
                                                                header( 'Content-type: text/html; charset=utf-8' );

$query = "SELECT rname, RankLogo FROM `Rank`"; //You don't need a ; like you do in SQL
$result = mysqli_query( $db,$query );

//	echo "<table>"; // start a table tag in the HTML

while( $row = mysqli_fetch_array( $result ) )
{
    //Creates a loop to loop through results
    echo "<tr><td>" . $row['rname'] . "</td><td>" . $row['RankLogo'] . "</td></tr>";  //$row['index'] the index here is a field name
}

//	echo "</table>"; //Close the table in HTML

mysqli_close(); //Make sure to close out the database connection
?>
</tr>
</table>

	        	


	        </div>
	       </div>
	




<?php
include"includes/footer.php";
?>