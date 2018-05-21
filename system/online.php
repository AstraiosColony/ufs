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
// Configuration settings
header( 'Content-type: text/html; charset=utf-8' );
include( "config.php" );
mysqli_set_charset( $db,"utf8" );

$DEBUG = $_POST['debug'];
$BRANCH = $_POST['branch'];
$uuid = $_POST['uuid'];

// SQL CommLink by Avatar UUID
$Members = "SELECT a.UUID FROM accounts a WHERE a.active='1'";
$RemoveComm = "DELETE FROM `Comms` WHERE (SELECT a.ID FROM `accounts` a WHERE a.UUID='$uuid')=`Comms`.accountid";

function GetMembers( $db,$sql )
{
    global $DEBUG;
    if( $DEBUG )
    {
        echo "\nGetting Members\n";
    }

    if( !$result = mysqli_query( $db,$sql ) )
    {
        die( "ERROR|UpdateCommLink: ".mysqli_error( $db ) );
    }
    echo "ACCOUNTS|";
    while( $row = mysqli_fetch_array( $result ) )
    {
        echo $row['UUID']."|";
    }
}

function RemoveComms( $db,$sql )
{
    global $DEBUG;
    if( $DEBUG )
    {
        echo "\nGetting Members\n";
    }
    if( !$result = mysqli_query( $db,$sql ) )
    {
        die( "ERROR|UpdateCommLink: ".mysqli_error( $db ) );
    }
    msqli_commit();
}

switch( $BRANCH )
{
case "lookup":
    GetMembers( $db,$Members );
    die( "-EOF-" );
case "remove":
    RemoveComms( $db,$RemoveComm );
    die( "-EOF-" );
}

?>