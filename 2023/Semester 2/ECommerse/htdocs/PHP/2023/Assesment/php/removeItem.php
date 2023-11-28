<?php
session_start();
include_once("Product.php");
$cartMd = unserialize($_SESSION['cart_array']);
$prodID = $_POST["prodID"];
$depth = 0;
$depth = $cartMd->get_depth();
for ($i = 0; $i < $depth; $i++) {
    echo $i;
    if ($prodID == $cartMd->get_product($i)->get_prodId()) {

        echo "\n".$i."\n Test";
        $cartMd->delete_product($i);
    }
}
header("Location: ../html/viewCart.php");
exit();
?>