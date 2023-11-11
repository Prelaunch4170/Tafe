<?php
//Start the session
session_start();
include 'cart.php';
$cart = new Cart();
$counter= $_SESSION['counter'];
    if(!isset($_SESSION['counter'])){
        
    }
?>
<html>
<body>

<?php
//check whether the cart is empty or not

if ($counter == 0) {
    echo"<h1>Shopping Cart</h1>";
    echo"<br><br><p><b> Your Shopping Cart is empty !!! </b></p>";
    echo"<p><b> <a href=products.php>Go back to products </a> </b></p>";
} else {
    $cart = unserialize($_SESSION['cart']);
  
    //Get the depth of the cart
	$depth = $cart->get_depth();
    echo"<h1>Shopping Cart</h1>";
    echo "<table border=1>";
    echo"<tr><td><b>product Name</b></td><td><b>Quantity</b></td><td><b> Price</b></td></tr>";
	//Use a for loop to Iterate through the cart
    for ($i=0; $i < $depth; $i++) {
        $product = $cart->get_product($i);
		$product_id = $product->get_product_id();
		$product_name = $product->get_product_name();
		$qty = $product->get_qty();
		$unit_price = $product->get_unit_price();
		echo "<tr><form  action=remove_from_cart.php method=POST>";
		echo"<td>$product_name</td><td>$qty </td><td>$unit_price</td>";
		echo "<td> <input name= index type=checkbox id= index value=$i></td>";
		echo"<td><INPUT  name=remove TYPE=submit id=remove value=Remove></td>";
		echo "</tr></form>";
        
    }

    echo "</table>";
    echo"<p><b> <a href=checkout.php>Checkout </a> </b></p>";
    echo"<p><b> <a href=products.php>Go back to products </a> </b></p>";
}
	?>
</body>
</html>
