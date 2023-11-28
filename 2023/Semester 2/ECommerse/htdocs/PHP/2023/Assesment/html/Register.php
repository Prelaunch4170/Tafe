<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Register</title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<?php
include_once("../php/conn_db.php");
$email = "";
$pwd = "";
$rePwd = "";
$address = "";
$postcode = "";
$state = "";
$phoneNum = 0;
$hashedPassword = "";


$emailError = "";
$PwdError = "";
$rePwdError = "";
$addressError = "";
$postcodeError = "";
$stateError = "";
$phoneError = "";
$invalidData = false;
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $pwd = $_POST['pwd'];
    $address = $_POST['address'];
    $postcode = $_POST['postcode'];
    $state = $_POST['state'];
    $rePwd = $_POST['pwd2'];
    $phoneNum = $_POST['phoneNum'];

    if ($email == "" || !strpos($email, "@") && !strpos($email, ".")) {
        $emailError = "Invalid Email";
        $invalidData = true;
    }
    if ($pwd == "") {
        $PwdError = "Enter Password";
        $invalidData = true;
    }
    if ($rePwd <> $pwd) {
        $rePwdError = "Passwords do not match " + $rePwd + " " + $pwd;
        $invalidData = true;
    }
    if ($address == "") {
        $addressError = "Please enter Address";
        $invalidData = true;
    }
    if ($postcode == "") {
        $postcodeError = "Please Enter Postcode";
        $invalidData = true;
    }
    if ($state == "") {
        $stateError = "Please select State";
        $invalidData = true;
    }
    if (!is_numeric($phoneNum) == 1 || strlen((string)$phoneNum) != 10) {
        $phoneError = "Invalid phone number ";
        $invalidData = true;
    }
    $query = "SELECT * FROM customer WHERE email = ?";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $emailError = "Email already in use.";
        $invalidData = true;
    }
    if (!$invalidData) {
        $query = "INSERT INTO customer (email, passwrd, address, postcode, state, phoneNum) VALUES (?,?,?,?,?,?)";
        $stmt = $mysqli->prepare($query);
        $hashedPassword = password_hash($pwd, PASSWORD_DEFAULT);
        $stmt->bind_param("ssssss", $email, $hashedPassword, $address, $postcode, $state, $phoneNum);
        $stmt->execute();
        session_start();

        $query = "SELECT * FROM customer WHERE (email = ?)";
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $customerID = $row['customerID'];

        $_SESSION['email'] = $email;
        $_SESSION['custID'] = $customerID;
        $cartID = rand();
        $cartID = md5($cartID);
        $_SESSION['cartID'] = $cartID;

        header("Location: searchAll.php");
        exit();
    }
}



?>

<body>
    <div class="topnav">
        <div class="links">
            <a href="searchAll.php">Home</a>
            <a class="active">Register</a>
            <a href="viewCart.php">View Cart</a>
        </div>
    </div>
    <div class="RegisterDiv">

        <form enctype='multipart/form-data' class="register" method="post" action=<?php echo $_SERVER["PHP_SELF"]; ?>>
            <label for="email">Email:</label>
            <input class="inputField" type="text" id="email" name="email" value="<?php echo $email; ?>"><span class="error" id="email-error"><?php echo $emailError; ?></span>

            <label for="pwd">Password:</label>
            <input class="inputField" type="password" id="pwd" name="pwd" value="<?php echo $pwd; ?>"><span class="error" id="pwd-error"><?php echo $PwdError; ?></span>
            <label for="pwd2">Retype Password:</label>
            <input class="inputField" type="password" id="pwd2" name="pwd2" value="<?php echo $rePwd; ?>"><span class="error" id="pwd2-error"><?php echo $rePwdError; ?></span>

            <label for="address">Street Number and Name:</label>
            <input class="inputField" type="text" id="address" name="address" value="<?php echo $address; ?>"><span class="error" id="address-error"><?php echo $addressError; ?></span>

            <label for="postcode">Postcode:</label>
            <input class="inputField" type="text" id="postcode" name="postcode" value="<?php echo $postcode; ?>"><span class="error" id="postcode-error"><?php echo $postcodeError; ?></span>

            <label for="phoneNum">Phone Number:</label>
            <input class="inputField" type="number" id="phoneNum" name="phoneNum" value="<?php echo (int)$phoneNum; ?>"><span class="error" id="phoneNum-error"><?php echo $phoneError; ?></span>

            <label for="state">State:</label>
            <select class="inputField" name="state" id="state">
                <option value="NSW">New South Wales</option>
                <option value="VIC">Victoria</option>
                <option value="QLD">Queensland</option>
                <option value="WA">Western Australia</option>
                <option value="SA">South Australia</option>
                <option value="TAS">Tasmania</option>
                <option value="NT">Northern Territory</option>
                <option value="ACT">Australian Capital Territory</option>
            </select><span class="error" id="state-error"><?php echo $stateError; ?></span>

            <input type="submit" value="Register">
        </form>
    </div>
    <footer>
        <div class="info">
            <p>Author: Andre Alexandrov</p>
            <p>All rights reserved</p>
        </div>
    </footer>
</body>

</html>