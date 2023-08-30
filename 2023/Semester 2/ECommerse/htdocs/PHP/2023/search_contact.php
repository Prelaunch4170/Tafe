<?php
    //connect to db
    include_once("conn_db.php");
    $lastname = $_POST['lastname'];
    // BAD!!!!! $query = "SELECT * FROM contacts WHERE lastname = '$lastname'";
    $query = "SELECT * FROM contacts WHERE lastname like ?";

    try{
        $stmt = $mysqli -> prepare($query);
        $stmt->bind_param("s", $lastname);
        $stmt->execute();
        $result = $stmt->get_result();
        //print_r($result);
        while ($row = $result->fetch_assoc()){
            echo $row["firstname"]. " " .$row['lastname']. " " .$row['phone']. " " .$row['email']."<br/>";
        }
    }catch(Exception $e){
        error_log($e->getMessage());
        exit("Error connecting to the table");
    }
    $mysqli -> close();
?>