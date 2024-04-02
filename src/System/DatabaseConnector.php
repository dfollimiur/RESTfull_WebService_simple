<?php

class DatabaseConnector {

    private $dbConnection = null;

    public function __construct()
    {
        if (file_exists(__DIR__ . '/../config.php'))
            require_once(__DIR__ . '/../config.php');
        else
            exit('DB configuration file missing');

        try {
            $this->dbConnection = new \PDO(
                "mysql:host=$host;port=$port;charset=utf8mb4;dbname=$db",
                $user,
                $pass
            );
        } catch (\PDOException $e) {
            exit($e->getMessage());
        }
    }

    public function getConnection()
    {
        return $this->dbConnection;
    }
}