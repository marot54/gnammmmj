<?php

class Base {

    private static $dblink;

    public static function connect() {
        try {
            $dsn = "mysql:host=localhost;dbname=acsi";
            $dblink = new PDO($dsn, "root", "", array(PDO::ERRMODE_EXCEPTION => true,
                PDO::ATTR_PERSISTENT => true));
        } catch (PDOException $e) {
            echo ("connection: $dsn " . $e->getMessage() . '<br/>');
        }
        return $dblink;
    }

    public static function getConnection() {
        if (isset(self::$dblink)) {
            return self::$dblink;
        } else {
            self::$dblink = self::connect();
            return self::$dblink;
        }
    }

}

?>