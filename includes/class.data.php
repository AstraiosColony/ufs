<?php

class Data
{

	public function Get_Users($status)
	{
		global $db;
		if($status == ACTIVE)
		{
			$binary_status = "1";
		}
		else
		{
			$binary_status = "0";
		}
		$sql = "SELECT COUNT(active) as 'accounts'
FROM accounts WHERE active='" . $binary_status . "'";
		$result = mysqli_query($db, $sql);
		return $result; 
	}


}



?>