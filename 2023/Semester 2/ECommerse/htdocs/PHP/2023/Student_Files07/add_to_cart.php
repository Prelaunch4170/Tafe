<?php
//Start the session
session_start();
include 'cart.php';
//get the product_id and the quantity
$product_id= $_POST['product_id'];
$qty=$_POST['qty'];
//store number of products in the shopping cart
$counter = $_SESSION['counter'];
$cart = new Cart();
//unserialize the cart if the cart is not empty
if ((isset($_SESSION['counter'])) && ($_SESSION['counter'] !=0)){
    $counter = $_SESSION['counter']; 
	//	unserialize convert the session object which is a string to a cart object
	$cart = unserialize($_SESSION['cart']);
}  
else {
	$_SESSION['counter'] = 0;
	$_SESSION['cart'] = "";
}
if (($product_id == "")or ($qty < 1))
{
   //Redirect the user back to product page
   echo "test 1";
   	//header("Location:products.php");
	$mysqli->close();
	exit();
}
else
{
	//connect to server and select database
	require_once("conn_db.php");
	//Create a select query to retrive the selected product 
	$query = "SELECT product_name, unit_price FROM products WHERE (product_id = ?)";
	echo $query;
	echo "</br> $product_id </br>";
    //Run the mysql query
    $stmt = $mysqli->prepare($query);
	$stmt->bind_param("s", $product_id);
	$stmt->execute();
	$result = $stmt->get_result();
    //If there is a matching recored select product_name, unit_price
	if(mysqli_num_rows($result) == 1)
	{
		//add products to the cart
		$row = $result->fetch_assoc();
		$product_name = $row['product_name'];
		$unit_price = $row['unit_price'];

		$new_product = new product($product_id, $product_name, $qty, $unit_price);
		$cart->add_product($new_product);
		//update the counter
		$_SESSION['counter'] = $counter+1;
		$_SESSION['cart'] = serialize($cart);
		//Redirect to the view_cart.php
		header("Location:view_cart.php");
		$mysqli->close();
		exit();
    }
    else
    {
		//Redirect to back to the product page
		//header("Location:products.php");
		echo "test 2";
		$mysqli->close();
		exit();
    }
	$mysqli->close();
}
	
?>
