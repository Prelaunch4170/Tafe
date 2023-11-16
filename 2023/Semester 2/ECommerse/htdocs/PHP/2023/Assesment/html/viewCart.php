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
session_start();
if (isset($_SESSION['email'])){
    $account = $_SESSION['email'];
    $Signout = '<a href="Logout.php">Sign out</a>';
    $SignedIn = "";
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
                    <li>
                        <div class="product">
                            <div class="prodImage">
                                <img src="../img/testimage.png" alt="Denim Jeans" style="width:100%">
                            </div>
                            <div class="prodInfo">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Name<br></th>
                                            <th>Price</th>
                                            <th>Amount<br></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Jeans</td>
                                            <td>$20</td>
                                            <td><input type="number" size="4" max="999" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </li>

                </ul>
            </div>
            <div class="orderSummary">
                <form>
                    <table>
                        <thead>
                            <tr>
                                <th>Items<br></th>
                                <th>Amount</th>
                                <th>Total<br></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Jeans</td>
                                <td>$20</td>
                                <td>10</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>$200</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
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