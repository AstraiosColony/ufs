<?php

class Staff 
{

public function list()
	{
   {
		$db = $_GLOBALS['db'];

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
}


}
}



		