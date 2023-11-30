<?php
session_start();
include_once("Product.php");
$cartMd = unserialize($_SESSION['cart_array']);
$prodID = $_POST["prodID"];
$depth = 0;
$depth = $cartMd->get_depth();
print($prodID);
print("Test </br>");
for ($i = 0; $i < $depth; $i++) {
<<<<<<< Updated upstream
    $index = 0;
    $index = $i;
    print("</br>");
    print($cartMd->get_product($index)->get_prodId());
    print("</br>");
    if ($prodID == $cartMd->get_product($index)->get_prodId()) {
        $cartMd->delete_product($index);
=======
    echo $i;
    if ($prodID == $cartMd->get_product($i)->get_prodId()) {
        $cartMd->delete_product($i);
>>>>>>> Stashed changes
        $_SESSION['cart_array'] = serialize($cartMd);
        break;
    }
}
header("Location: ../html/viewCart.php");
exit();
?>