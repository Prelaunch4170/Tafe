<!DOCTYPE html>

<html>

<head>
    <title>View Sepcific Product</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/main.css">
</head>
<?php 
$Signout = "";
$account = "Login";
$SignedIn = "Login.php";
session_start();
if (isset($_SESSION['email'])){
    $account = $_SESSION['email'];
    $Signout = '<a href="Logout.php">Sign out</a>';
    $SignedIn = "";
}

?>
<body>
    <div class="topnav">
        <div class="links">
            <a class="active">Home</a>
            <a href=<?php echo $SignedIn; ?>><?php echo $account; ?></a>
            <a href="viewCart.php">View Cart</a>
            <?php echo $Signout; ?>
        </div>
    </div>

    <div class="viewDiv">
        <div class="sidePanel">
            <label for="search">Search</label>
            <input name="search" type="text" value="test input" size=10 />
            <p>Testing the side panel</p>
            <p>Testing the side panel</p>
            <p>Testing the side panel</p>
            <p>Testing the side panel</p>
        </div>
        <div class="productView">
            <div class="card">
                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                <h1>Tailored Jeans</h1>
                <p class="price">$19.99</p>
                <p>Some text about the jeans..</p>
                <p>
                    <button name="View">View Product</button>
                </p>
            </div>
            <div class="card">
                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                <h1>Tailored Jeans</h1>
                <p class="price">$19.99</p>
                <p><span><?php echo $test; ?></span></p>
                <p>
                    <button name="View">View Product</button>
                </p>
            </div>
            <div class="card">
                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                <h1>Tailored Jeans</h1>
                <p class="price">$19.99</p>
                <p><span><?php echo $test; ?></span></p>
                <p>
                    <button name="View">View Product</button>
                </p>
            </div>
            <div class="card">
                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                <h1>Tailored Jeans</h1>
                <p class="price">$19.99</p>
                <p><span><?php echo $test; ?></span></p>
                <p>
                    <button name="View">View Product</button>
                </p>
            </div>
            <div class="card">
                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                <h1>Tailored Jeans</h1>
                <p class="price">$19.99</p>
                <p><span><?php echo $test; ?></span></p>
                <p>
                    <button name="View">View Product</button>
                </p>
            </div>
            <div class="card">
                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                <h1>Tailored Jeans</h1>
                <p class="price">$19.99</p>
                <p><span><?php echo $test; ?></span></p>
                <p>
                    <button name="View">View Product</button>
                </p>
            </div>
            <div class="card">
                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                <h1>Tailored Jeans</h1>
                <p class="price">$19.99</p>
                <p><span><?php echo $test; ?></span></p>
                <p>
                    <button name="View">View Product</button>
                </p>
            </div>
            <div class="card">
                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                <h1>Tailored Jeans</h1>
                <p class="price">$19.99</p>
                <p><span><?php echo $test; ?></span></p>
                <p>
                    <button name="View">View Product</button>
                </p>
            </div>
            <div class="card">
                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                <h1>Tailored Jeans</h1>
                <p class="price">$19.99</p>
                <p><span><?php echo $test; ?></span></p>
                <p>
                    <button name="View">View Product</button>
                </p>
            </div>

        </div>
    </div>




    <script src="../js/main.js" async defer></script>
    <footer>
        <div class="info">
            <p>Author: Andre Alexandrov</p>
            <p>All license to me</p>
        </div>
    </footer>
</body>


</html>