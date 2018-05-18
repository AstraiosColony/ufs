
<?php

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