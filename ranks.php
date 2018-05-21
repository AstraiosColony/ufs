<?php
/*
* Copyright 2018 Orbital Group
*
*   Licensed under the Apache License, Version 2.0 (the "License");
*   you may not use this file except in compliance with the License.
*   You may obtain a copy of the License at
*
*       http://www.apache.org/licenses/LICENSE-2.0
*
*   Unless required by applicable law or agreed to in writing, software
*   distributed under the License is distributed on an "AS IS" BASIS,
*   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*   See the License for the specific language governing permissions and
*   limitations under the License.
*
*
*/

$page_title = "Rank Marks ";
include"includes/load.php";


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