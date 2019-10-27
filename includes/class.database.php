<?php
/**
 * Database Class
 *
 * This is the database connection class that all queries,
 * connections, and references to the database use
 *
 */

class Database {
	private $_connection;
	private static $_instance; //The single instance
	private $_host = "localhost"; /// The hostname, usually "localhost" will work 
	private $_username = "astraios"; /// Don't Use the Root User This is Bad Practice
	private $_password = "S2MV8yc$#uFG?YgA"; /// Example Password
	private $_database = "astraios";
	/*
	Get an instance of the Database
	@return Instance
	*/
	public static function getInstance() {
		if(!self::$_instance) { // If no instance then make one
			self::$_instance = new self();
		}
		return self::$_instance;
	}
	// Constructor
	private function __construct() {
		$this->_connection = new mysqli($this->_host, $this->_username, 
			$this->_password, $this->_database);
	
		// Error handling
		if(mysqli_connect_error()) {
			trigger_error("Failed to connect to MySQL: " . mysqli_connect_error(),
				 E_USER_ERROR);
		}
	}
	// Magic method clone is empty to prevent duplication of connection
	private function __clone() { }
	// Get mysqli connection
	public function getConnection() {
		return $this->_connection;
	}
}
?>
