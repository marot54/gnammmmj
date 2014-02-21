<?php
class Base
{

	public static function getConnection()
	{
		include ('config.php');
		$db = new PDO($dsn, $user, $pass, array(PDO::ERRMODE_EXCEPTION=>true,
			PDO::ATTR_PERSISTENT=>true));
		$db->exec("set character set utf-8");
		return $db;
	}

}
?>