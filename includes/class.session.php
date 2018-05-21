
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

/**
   * Session
   * 
   * 
   * @package    Orbital
   * @author     Hollow Omnicron <hollow@omega-grid.org>
   */

class Session
{
    
    public function make_shit()
    {
        $this->make_session();
        $this->check_session();
        $this->session_data();
    }
    
    public function make_session()
    {
        session_start();
    }
    public function end_shit()
	{
	// Unset all of the session variables
$_SESSION = array();
 
// Destroy the session.
session_destroy();
 
// Redirect to login page
header("location: login"); // 
}
    public function check_session()
    {
        
        // If session variable is not set it will redirect to login page
        if (!isset($_SESSION['username']) || empty($_SESSION['username'])) {
            header("location: login.php");
        }
        
    }
    
    public function session_data()
    {
        global $db;
        $sql = "SELECT * FROM accounts WHERE username='" . $_SESSION['username'] . "'";
        
        $profile_info = mysqli_query($db, $sql);
        
        while ($row = mysqli_fetch_array($profile_info)) {
            
            $_SESSION['display_name'] = $row['DisplayName'];
            $_SESSION['email']        = $row['email'];
            $_SESSION['level']        = $row['db_privlage_level'];
            $_SESSION['div_id']       = $row['DivID'];
            $_SESSION['rank_id']      = $row['RankID'];
            $_SESSION['title_id']     = $row['TitleID'];
            $_SESSION['title_id']     = $row['TitleID'];
            
        }
        
        $oauth_sql = "SELECT * FROM oauth WHERE username='" . $_SESSION['username'] . "'";
        
        $oauth_info = mysqli_query($db, $oauth_sql);
        
        while ($row = mysqli_fetch_array($oauth_info)) {
            
            $_SESSION['bitly_oauth'] = $row['bitly'];
            
        }
        
    }
}
?>