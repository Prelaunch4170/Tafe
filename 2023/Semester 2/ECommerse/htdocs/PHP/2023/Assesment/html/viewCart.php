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
$creditError = "";
$entered = "";
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
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $creditError = "Test";
    $number = $_POST['credit'];
    if (strlen($number) < 13 || strlen($number) > 19) {
        $creditError = "Invalid";
        $entered = $number;
    } else {

        $creditError = "Test1";
        // Strip any non-digits (useful for credit card numbers with spaces and hyphens)
        $number = preg_replace('/\D/', '', $number);

        // Set the string length and parity
        $number_length = strlen($number);
        $parity = $number_length % 2;

        // Loop through each digit and do the maths
        $total = 0;
        for ($i = 0; $i < $number_length; $i++) {
            $digit = $number[$i];
            // Multiply alternate digits by two
            if ($i % 2 == $parity) {
                $digit *= 2;
                // If the sum is two digits, add them together (in effect)
                if ($digit > 9) {
                    $digit -= 9;
                }
            }
            // Total up the digits
            $total += $digit;
            $creditError = "Test" . $i . "Test";
        }
        // If the total mod 10 equals 0, the number is valid
        if ($total % 10 == 0) {
            $creditError = "pass";
            header("Location: ../php/buyItems.php");
            exit();
        } else {
            $creditError = "fail";
            $entered = $number;
        }
    }
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
                        echo "<td><input type='text' size='3' value='$prodQty' readonly/></td>";
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
                <form enctype='multipart/form-data' method="post" action=<?php echo $_SERVER["PHP_SELF"]; ?>>
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
                                <td>
                                    <input type='number' value="<?php echo $entered; ?>" placeholder="Card Number" id="credit" name="credit" />
                                    <span class="error" id="userPass-error"><br><?php echo $creditError; ?>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td><input type='text' placeholder="CVV" id="CVV" name="CVV" /></td>
                            </tr>
                            <tr>
                                <td>Expiry:</td>
                            </tr>
                            <tr>
                                <td><input type='date' id="Expr" name="Expr" /></td>
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