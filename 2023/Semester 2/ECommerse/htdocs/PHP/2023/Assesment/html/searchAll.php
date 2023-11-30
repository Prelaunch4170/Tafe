<!DOCTYPE html>

<html>

<head>
    <title>View Products</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/main.css">
</head>
<?php 
$Signout = "";
$account = "Login";
$SignedIn = "Login.php";
$Test = "IT";
$product = "";
session_start();
$counter = "";
if (isset($_SESSION['email'])) {
    $account = $_SESSION['email'];
    $Signout = '<a href="Logout.php">Sign out</a>';
    $SignedIn = "";
}
//Loads the page to show nothing
if($product == ""){
    include_once("../php/conn_db.php");
    $query = "SELECT * FROM product";
    $stmt = $mysqli->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $counter = 0;
    if (!isset($_SESSION['counter'])) {
    } else {
        $counter = $_SESSION['counter'];
    }
}
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $Test = "ITWorks";
    $product = "%".$_POST["searchProd"]."%";
    $Test = $product;
    include_once("../php/conn_db.php");
    $query = "SELECT * FROM product WHERE productName LIKE ?";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("s", $product);
    $stmt->execute();
    $result = $stmt->get_result();
    $counter = 0;
    if (!isset($_SESSION['counter'])) {
    } else {
        $counter = $_SESSION['counter'];
    }
}

?>
<body>
    <div class="topnav">
        <div class="links">
            <a class="active">Home</a>
            <a href=<?php echo $SignedIn; ?>><?php echo $account; ?></a>
            <a href="viewCart.php">View Cart <?php echo $counter; ?></a>
            <?php echo $Signout; ?>&emsp;
            <form method='POST'  action=<?php echo $_SERVER["PHP_SELF"]; ?>>
            <label for="search">Search</label>
            <input name="searchProd" type="text" id="searchProd" value="" size=10 />
            <button type='submit' name='searchBtn'>Search</button>
            </form>
        </div>
    </div>

    <div class="viewDiv">
        <div class='productView'>
            <?php

                while ($row = $result->fetch_assoc()) {
                    //Using the while loop populate all product in a table
                    $product_id = $row["productID"];
                    $product_name = $row["productName"];
                    $unit_price = $row["productPrice"];
                    $qty = $row["productQuantity"];
                    $image = $row["productImage"];
                    $desc = $row["productDescription"];
    
                    echo "<div class='card'>";
                    echo "<div class='card-content'>";
                    echo "<img src='$image' alt='$product_name' style='width:100%'>";
                    echo "<h1>$product_name </h1>";
                    echo "<p class='pric'>$unit_price</p>";
                    echo "<p>$desc</p>";
                    echo "</div>";
                    echo "<form action='../php/add_to_cart.php' method='POST'>";
                    echo "<input type='hidden' name='prodID' value='$product_id'>";
                    echo "<p class='viewBtn'> <button type='submit' name='View'>Add to Cart</button> </p>";
                    echo "</form>";
                    echo "</div>";
                }
            
            
            ?>
        </div>
    </div>




    <script src="../js/main.js" async defer></script>
    <footer>
        <div class="info">
            <p>Author: Andre Alexandrov</p>
            <p>All rights reserved</p>
        </div>
    </footer>
</body>


</html>