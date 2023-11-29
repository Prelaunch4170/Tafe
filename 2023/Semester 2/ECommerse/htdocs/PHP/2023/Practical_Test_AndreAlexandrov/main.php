<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
table, td{
    border: 1px solid black;
}

</style>
<?php
include "Bank_Accounts.php";
include_once("conn_db.php");
$account1 = new Bank_Account("10001", "James", "Buissness", 1000.91);
$account2 = new Bank_Account("10001", "James", "Buissness", 1000.91);

$query = "SELECT * FROM product ORDER BY product_id;";
$stmt = $mysqli->prepare($query);
$stmt->execute();
$result = $stmt->get_result();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $deleteID = $_POST['ID'];

    $query = "DELETE FROM product WHERE product_id = ?;";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("s", $deleteID);
    $stmt->execute();
    header("refresh: 0.1");
}

?>

<body>
    <p><?php echo $account1->get_details(); ?></p>
    <p><?php echo $account2->get_details(); ?></p>
    <p>Product Info:</p>
    <table>
        <tr>
            <td>Product ID</td>
            <td>Product Name</td>
            <td>Product stock</td>
            <td>Product price</td>
            <td>Product category</td>
        </tr>

        <?php
        while ($row = $result->fetch_assoc()) {
            $prod_id = $row["product_id"];
            $prod_name = $row["product_name"];
            $stock = $row["sock_amount"];
            $price =  $row["product_price"];
            $category =  $row["category"];
            echo "<tr>";
            echo "<td>$prod_id</td>";
            echo "<td>$prod_name</td>";
            echo "<td>$stock</td>";
            echo "<td>$price</td>";
            echo "<td>$category</td>";
            echo "</tr>";
        }
        ?>
    </table>
    <form enctype='multipart/form-data' class="register" method="post" action=<?php echo $_SERVER["PHP_SELF"]; ?>>
        <input type="text" name='ID' placeholder="Product ID"/>
        <input type="submit" value="Delete"/>
    </form>
</body>

</html>