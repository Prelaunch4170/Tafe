<?php
$email = "test@hotmail.com";

if($email ==""){
    echo "Email has been left blank";
}
elseif ((!strstr($email,"@")) || (!strstr($email, ".")))
{
    echo "email is invalid"
}
elseif (strlen(($email)<8)){
    echo "Email is invalid";
}

?>