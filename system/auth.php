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
include"config.php";
$uuid = $_POST['uuid'];
$code = $_POST['code'];

$error = "\n\nPersonnel Authorization Error\nContact SS Pathfinder IT with the provided Error Message\n";


// SQL statments
// Insert UUID Username
$SelectAV = "SELECT r.rname, a.DisplayName, d.dname FROM `accounts` a INNER JOIN `divisions` d ON a.`DivID` = d.`did` INNER JOIN `Rank` r ON a.`RankID` = r.`RankID` WHERE a.`cCode` = '$code' AND a.`active`='1' AND a.`UUID` = '$uuid'";

$result = mysqli_query( $db,$SelectAV );
$isRecord =  mysqli_num_rows( $result );

if ( $isRecord == 0 ) // Is there a record already?
{
    echo "ERROR|Authentication lookup failed";
}
elseif( $isRecord == 1 )
{
    $row = mysqli_fetch_array( $result );
    echo "OK|".$row['rname']."|".$row['DisplayName']."|".$row['dname'];
}
else //Supper Broken should never get here unless database keys are scrwed up
{
    echo "ERROR|/!\\ CRITICAL /!\\ isRecord returned more then ONE result. this should NEVER happen. MySQL Table structure has been comprimised.".$error;
}
?>
