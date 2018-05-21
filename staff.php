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

$page_title = "standard";
$page_title = "Staff List";
include"includes/load.php";

?>


		 <div id="page-wrapper" class="gray-bg dashbard-1">
       <div class="content-main">
 
 	<!--banner-->	
		     <div class="banner">
		    	<h2>
				<a href="index">Home</a>
				<i class="fa fa-angle-right"></i>
				<span><?php echo $page_title; ?></span>
				</h2>
		    </div>
		<!--//banner-->
 	<div class="blank">
	
   
<?php
$DivHeaders = "SELECT `did`, `dname` FROM `divisions` WHERE NOT did='10' ORDER BY `dname`";
               $DivResult = mysqli_query( $db,$DivHeaders );
while( $DivHeaders = mysqli_fetch_array( $DivResult ) )
{
    $MembersByDivision = "SELECT r.RankLogo, r.rname, IFNULL(a.DisplayName, a.username) AS `name`, t.tag_name, a.`UUID` FROM `accounts` a INNER JOIN `divisions` d ON a.`DivID` = d.`did` INNER JOIN `Rank` r ON a.`RankID` = r.`RankID` INNER JOIN `Titles` t ON a.`TitleID` = t.`tid` WHERE a.active = '1' AND NOT d.did='10' AND d.did = '" . $DivHeaders['did'] . "' ORDER BY r.`RankID`";

	echo"<div class='grid_3'>";
    echo "<h3>" . $DivHeaders['dname'] . "</h3>";
    echo "<table align='center' style='width:100%'><tr class='box'><th align='center'>Rank</th><th align='center'>Name</th><th align='center'>Title</th></tr>";//Set up each table on the page

    $result = mysqli_query( $db,$MembersByDivision );


    while( $row = mysqli_fetch_array( $result ) )
    {
        //Creates a loop to loop through results
        echo "<tr><td align='center'>" . $row['rname'] . "<br>" . $row['RankLogo'] . "</td><td><a href='secondlife:///app/agent/" . $row['UUID'] . "/about' style='color:#FDD017'>" . $row['name'] . "</a></td><td align='left'>" . $row['tag_name'] . "</td></tr>";
    }
    echo "</table>";
    echo "</div>";
}
?>




	   
	        </div>
	       </div>
	




<?php
include"includes/footer.php";
?>
