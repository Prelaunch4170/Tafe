<?php
//Connect to the server
$server = 'localhost:3307';
$user = 'root';
$pass = '';
$database = 'contactdb';
$mysqli = mysqli_connect($server,$user,$pass,$database) or die ("error connecting to database");
?>