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

$page_type = "standard";
$page_title = "Most Active Members";
require"includes/load.php";

// And Away We Go

?>


		 <div id="page-wrapper" class="gray-bg dashbard-1">


<div class="content-main">
 
 	<!--banner-->	
		     <div class="banner">
		    	<h2>
				<a href="index.html">Home</a>
				<i class="fa fa-angle-right"></i>
				<span>Blank</span>
				</h2>
		    </div>
		<!--//banner-->
 	 <!--faq-->
 	<div class="blank">
	

			<div class="blank-page">
				
	        	<?php
// Grab the top 5 most active members from the Time clock
$ActiveMembers = "SELECT IFNULL(a.DisplayName,a.username) AS `name`, SEC_TO_TIME(SUM(`time_out` - `time_in`)) AS `total` FROM `Time Clock` as t JOIN `accounts` a ON t.user_id = a.ID GROUP BY t.`user_id` ORDER BY total DESC LIMIT 5";
function MembersByTime( $db,$sql )
{
    if( !$result = mysqli_query( $db,$sql ) )
    {
        die( "ERROR-MembersByTime-".mysqli_error( $db ) );
    }
    echo "CLOCK?";
    while( $row = mysqli_fetch_array( $result ) )
    {
        $str = $row['name'].$row['total'];
        echo "  ".$row['name'].str_pad( " ", 36 - strlen( $str ) ).$row['total']."|";
    }
}
MembersByTime( $db,$ActiveMembers );
?>
	        </div>
	       </div>
	
	<!--//faq-->

	




<?php
include"includes/footer.php";
?>
