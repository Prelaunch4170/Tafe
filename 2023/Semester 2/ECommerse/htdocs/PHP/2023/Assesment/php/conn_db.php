<?php
//Connect to the server
$server = 'localhost';
$user = 'root';
$pass = '';
$database = 'oldMates';
$mysqli = mysqli_connect($server,$user,$pass,$database) or die ("error connecting to database");
?>