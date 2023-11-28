<?php
$cartID = rand();
$cartID = md5($cartID);
$_SESSION['cartID'] = $cartID;
include_once("..\php\Product.php");
$cartMd = new cart_product_array();
$_SESSION['counter'] = 0;
$_SESSION['cart_array'] = serialize($cartMd);

header("Location: ../html/confirm.php");
exit();
?>