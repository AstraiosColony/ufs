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

header( 'Content-type: text/html; charset=utf-8' );
include( "config.php" );
mysqli_set_charset( $db,"utf8" );

$uuid = $_POST['uuid'];
$name = $_POST['name'];
$type = GetAssetName( $_POST['type'] );

$AssetUpload = "INSERT INTO `assets` (`uuid`,`type`,`name`) VALUES('$uuid',(SELECT `atid` FROM `asset_types` WHERE `type` LIKE '%$type%'), '$name')";
if( !$result = mysqli_query( $db,$AssetUpload ) )
{
    echo "ERROR|".mysqli_error( $db );
}
else
{
    echo "OK|Data Inserted";
}
mysqli_close( $db );
?>