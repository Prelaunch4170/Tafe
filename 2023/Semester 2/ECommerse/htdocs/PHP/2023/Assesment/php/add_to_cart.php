<?php

include_once("conn_db.php");

include "Product.php";
session_start();
$counter = 0;
$depth;
$location = 0;
if (!isset($_SESSION["custID"])) {
    header("Location: ../html/login.php");
    exit();
} else {

    $counter = $_SESSION['counter'];
    $prodID = $_POST["prodID"];
    if ((isset($_SESSION['counter'])) && ($_SESSION['counter'] != 0)) {
        $counter = $_SESSION['counter'];
        //	unserialize convert the session object which is a string to a cart object
        $cartMd = unserialize($_SESSION['cart_array']);
    } else {
        $_SESSION['counter'] = 0;
        $_SESSION['cart_array'] = "";
    }
    if (isset($_SESSION['cart_array']) && !empty($_SESSION['cart_array'])) {
        $cartMd = unserialize($_SESSION['cart_array']);
    } else {
        $cartMd = new cart_product_array();
    }
    
    $found = false;
    $_SESSION['cart_array'] = serialize($cartMd);
    $_SESSION['counter'] = $counter + 1;
    $cartMd = unserialize($_SESSION['cart_array']);
    $depth = $cartMd->get_depth();

    for ($i = 0; $i < $depth; $i++) {
        if ($prodID == $cartMd->get_product($i)->get_prodId()) {
            $found = true;
            $location = $i;
            break;
        }
    }
    if (!$found) {
        $product = new cart_product($prodID, 1);
        $cartMd->add_product($product);
        $_SESSION['cart_array'] = serialize($cartMd);
        $_SESSION['counter'] = $counter + 1;
    }else{
        $cartMd->get_product($location)->add_quantity();
        $_SESSION['cart_array'] = serialize($cartMd);
    }
    echo $cartMd->get_product($location)->get_prodId(). ' '. $cartMd->get_product($location)->get_quantity()."\n". $location;
    
    header("Location: ../html/searchAll.php");
    exit();
}
