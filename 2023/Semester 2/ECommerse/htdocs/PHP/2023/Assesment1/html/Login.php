<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<?php
$email = "";
$pwd = "";
$userPassError = "";
$hashedPassword = "";

include_once("../php/conn_db.php");
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $pwd = $_POST['pwd'];
    $hashedPassword = password_hash($pwd, PASSWORD_DEFAULT);

    $query = "SELECT * FROM customer WHERE (email = ?)";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("s", $email);
    $stmt->execute();

    if ($stmt->errno) {
        $userPassError = "Email or password is Wrong2";
    } else {
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        if ($row) {
            $storedPassword = $row['passwrd'];

            if (password_verify($pwd, $storedPassword)) {
                session_start();
                $_SESSION['email'] = $email;
                header("Location: searchAll.php");
                exit();
            } else {
                $userPassError = "Email or password is Wrongq " . $hashedPassword . "///////" . $storedPassword;
            }
        }
    }
}
?>

<body>
    <div class="topnav">
        <div class="links">
            <a href="searchAll.php">Home</a>
            <a class="active" href="Login.php">Login</a>
            <a href="viewCart.php">View Cart</a>
        </div>
    </div>
    <div class="logInDiv">
        <form enctype='multipart/form-data' class="register" method="post" action=<?php echo $_SERVER["PHP_SELF"]; ?>>
            <label for="email">Email:</label><br>
            <input type="text" id="email" name="email" value="<?php echo $email; ?>"><br>
            <label for="pwd">Password:</label><br>
            <input type="password" id="pwd" name="pwd"><span class="error" id="userPass-error"><br>
                <?php echo $userPassError; ?></span>
            <br>
            <input type="submit" value="Log In"><br>
            <a href="Register.php">register</a>
        </form>

    </div>
    <footer>
        <div class="info">
            <p>Author: Andre Alexandrov</p>
            
            <p>All license to me</p>
        </div>
    </footer>
</body>

</html>