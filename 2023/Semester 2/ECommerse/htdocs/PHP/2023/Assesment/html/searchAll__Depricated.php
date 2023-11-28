<!DOCTYPE html>

<html>

<head>
    <title>View All</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/main.css">
</head>
<?php
$Signout = "";
$account = "Login";
$SignedIn = "Login.php";

session_start();
if (isset($_SESSION['email'])) {
    $account = $_SESSION['email'];
    $Signout = '<a href="Logout.php">Sign out</a>';
    $SignedIn = "";
}
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

?>

<body>
    <div class="topnav">
        <div class="links">
            <a class="active">Home</a>
            <a href=<?php echo $SignedIn; ?>><?php echo $account; ?></a>
            <a href="viewCart.php">View Cart <?php echo $counter; ?></a>
            <?php echo $Signout; ?>

        </div>
    </div>
    <div class="viewDiv">
        <div class="sidePanel">
            
            <form>
            <label for="search">Search</label>
                <input name="search" type="text" value="test input" size=10 />
                <p>Testing the side panel</p>
                <p>Testing the side panel</p>
                <p>Testing the side panel</p>
                <p>Testing the side panel</p>
                <button type='submit' name='searchBtn'>search</button>
            </form>

        </div>

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
                echo "<img src='$image' alt='Denim Jeans' style='width:100%'>";
                echo "<h1>$desc</h1>";
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

            <p>All license to me</p>
        </div>
    </footer>
</body>


</html>