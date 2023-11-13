<?php

include_once("conn_db.php");

include "../html/Product.php";

$prodID = $_POST["prodID"];
$cartMd = new cart();
echo $cartMd-> create_cart($prodID);
echo $prodID;
header("Location: ../html/searchAll.php");
exit();

?>