<?php
session_start();
?>
<html>
<body>
<h1> Product Page </h1>
<table border="1">
<?php

//Connect to the database server and select the database
require_once("conn_db.php");
//Create a query to select all products
$query = "SELECT * FROM products";
$stmt = $mysqli->prepare($query);
$stmt->execute();
$result = $stmt->get_result();
//Display products
echo"<tr><td><b>Product Name</b></td> <td><b>Price</b></td>
    <td><b>Quantity</b></td><td></td></tr>";
while ($row = $result->fetch_assoc())
{
   //Using the while loop populate all product in a table
   $product_id = $row["product_id"];
   $product_name = $row["product_name"];
   $unit_price= $row["unit_price"];
   $qty= $row["qty"];
   echo "<tr><form action=add_to_cart.php method=POST>";
   echo "<input name=product_id type=hidden value=$product_id />";
   echo "<td> $product_name</td> ";
   echo "<td> $unit_price</td> ";
   echo "<td> $qty</td> ";
   echo "<td><input name=qty type=text value=1 size=2></td>";
   echo "<td><input name=add type=submit value=Add /></td>";
   echo "</tr></form>";
}
$mysqli -> close();
?>   

</table>
</body>
</html>
