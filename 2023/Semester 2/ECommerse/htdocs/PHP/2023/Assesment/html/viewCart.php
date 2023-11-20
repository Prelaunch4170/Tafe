<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cart</title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<?php
$Signout = "";
$account = "Login";
$SignedIn = "Login.php";
include_once("../php/conn_db.php");
include "../php/Product.php";
session_start();
if (isset($_SESSION['email'])) {
    $account = $_SESSION['email'];
    $Signout = '<a href="Logout.php">Sign out</a>';
    $SignedIn = "";
}
if (!isset($_SESSION["counter"])) {
    header("Location: ../html/login.php");
    exit();
} else {
    $counter = 0;
    $counter = $_SESSION["counter"];
    $cart = new cart_product_array();
    $cart = unserialize($_SESSION["cart_array"]);
    $depth = 0;
    $depth = $cart->get_depth();
    $prodID;
    $products;
    $prodName;
    $prodPrice;
    $prodQty;

    $totalPrice = 0;
    $totalProdPrice;
}

?>

<body>
    <div class="containter">
        <div class="topnav">
            <div class="links">
                <a href="searchAll.php">Home</a>
                <a href=<?php echo $SignedIn; ?>><?php echo $account; ?></a>
                <a class="active">View Cart</a>
                <?php echo $Signout; ?>
            </div>
        </div>
        <div class="itemsView">
            <div class="prosuctSection">
                <ul class="prodList">
                    <?php
                    for ($i = 0; $i < $depth; $i++) {
                        $products = new DBproduct();
                        $prodID = $cart->get_product($i)->get_prodId();
                        $prodName = $products->get_productName($prodID);
                        $prodPrice = $products->get_productPrice($prodID);
                        $prodQty = $cart->get_product($i)->get_quantity();
                        $totalProdPrice = $prodQty * $prodPrice;
                        $totalPrice += $totalProdPrice;
                        echo "<li>";
                        echo "<div class='product'>";
                        echo "<div class='prodImage'>";
                        echo "<img src='../images/test.jpg' alt='Denim Jeans' style='width:100%'>";
                        echo "</div>";
                        echo "<div class='prodInfo'>";
                        echo "<table>";
                        echo "<thead>";
                        if ($i < 1) {
                            echo "<tr>";
                            echo "<th>Name<br></th>";
                            echo "<th>Price</th>";
                            echo "<th>Amount<br></th>";
                            echo "</tr>";
                        }
                        echo "</thead>";
                        echo "<tbody>";
                        echo "<tr>";
                        echo "<td class='prodNameTD'>$prodName &nbsp;</td>";
                        echo "<td>$$prodPrice &nbsp;</td>";
                        echo "<td><input type='number' size='4' max='999' value='$prodQty'/></td>";
                        echo "</tr>";
                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";
                        echo "</li>";
                    }
                    ?>
                    <li>

                </ul>
            </div>
            <div class="orderSummary">
                <form action='../php/buyItems.php'>
                    <table>
                        <thead>
                            <tr>
                                <th>Total<br></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><?php echo "$$totalPrice" ?></td>
                            </tr>
                            <tr>
                                <td><input type='text' placeholder="Card Number" id="credit" name="credit" /></td>
                            </tr>
                            <tr>
                                <td><input type='text' placeholder="CVV" id="CVV" name="CVV" /></td>
                            </tr>
                            <tr>
                                <td>Expiry:</td>
                            </tr>
                            <tr>
                                <td><input type='date' id="Expr" name="Expr"/></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Buy"></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <footer>
        <div class="info">
            <p>Author: Andre Alexandrov</p>

            <p>All license to me</p>
        </div>
    </footer>
</body>

</html>