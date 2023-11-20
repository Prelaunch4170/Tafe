<?php
$prodID;
$quantity;
$cartMd;
session_start();
include "Product.php";
$cartAdd = new cart;
$cartMd = unserialize($_SESSION["cart_array"]);

$depth = $cartMd->get_depth();
$cartID = $_SESSION['cartID'];
$custID = $_SESSION['custID'];
$cartAdd->createCart();

for ($i = 0; $i < $depth; $i++) {
    $prodID = $cartMd->get_product($i)->get_prodId();
    $quantity = $cartMd->get_product($i)->get_quantity();
    $cartAdd->buyItems($prodID, $quantity);
}
