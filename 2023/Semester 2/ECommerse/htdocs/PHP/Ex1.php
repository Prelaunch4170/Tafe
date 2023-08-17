<?php
$email = "test@hotmail.com";
if($email == ""){
    echo "<p>Email has been left blank</p>";
}
else if ((!strstr($email,"@")) || (!strstr($email, ".")))
{
    echo "<p>email is invalid</p>";
}
else if (strlen(($email)<8)){
    echo "<p>Email is invalid</p>";
}
else {
    echo $email."<p/>";
}

for ($count=1; $count <12; $count++){
    echo $count."* 1502 = ".$count*1502 ."<br/>";
}
function getIP(){
    $ip = gethostbyname("www.tafesa.edu.au");
    return $ip;
}
function ValidEmail($emailCheck){
    
    $check =  filter_var($emailCheck, FILTER_VALIDATE_EMAIL);
    if (!$check ==  false){
        return "Valid";
    }
    else{
        return "Invalid";
    }
}
echo getIP();
echo "<br/>";

echo "email is ". ValidEmail($email);
echo "<br/>";
echo "email is ". ValidEmail("testlol@Test.com.au");

?>