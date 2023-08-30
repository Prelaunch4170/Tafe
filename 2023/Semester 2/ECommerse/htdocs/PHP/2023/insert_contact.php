<?php
    //connect to db
    include_once("conn_db.php");
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    // BAD!!!!! $query = "SELECT * FROM contacts WHERE lastname = '$lastname'";
    $query = "INSERT INTO contacts(firstname,lastname,phone,email) VALUES(?,?,?,?)";

    try{
        $stmt = $mysqli -> prepare($query);
        $stmt->bind_param("ssss",$firstname, $lastname,$phone,$email);
        $stmt->execute();
        $result = $stmt->get_result();
        echo "Record added";
    }catch(Exception $e){
        error_log($e->getMessage());
        exit("Error connecting to the table");
    }
    $mysqli -> close();
?>