<?php
//Connect to the server
$server = 'localhost';
$user = 'root';
$pass = '';
$database = 'oldMates';
$mysqli = mysqli_connect($server,$user,$pass,$database) or die ("error connecting to database");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
<script> console.log('Connected to Server')</script>
</html>