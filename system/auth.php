/**
* For the brave souls who get this far: You are the chosen ones,
* the valiant knights of programming who toil away, without rest,
* fixing our most awful code. To you, true saviors, kings of men,
* I say this: never gonna give you up, never gonna let you down,
* never gonna run around and desert you. Never gonna make you cry,
* never gonna say goodbye. Never gonna tell a lie and hurt you.
*/
/*
Orbital RP System
A Star Trek Roleplay Ssystem for the Virtual Metavserse
    Copyright (C) 2018  Orbit Technologies

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

<?php
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
