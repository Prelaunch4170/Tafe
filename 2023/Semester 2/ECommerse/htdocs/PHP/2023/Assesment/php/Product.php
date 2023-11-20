<?php

class DBproduct
{

  public function get_productName($prodID)
  {
    include_once("../php/conn_db.php");
    global $mysqli;
    $query = "SELECT * FROM product WHERE (productID = ?)";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("s", $prodID);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    return $row['productName'];
    $mysqli->close();
  }
  public function get_productPrice($prodID)
  {
    include_once("../php/conn_db.php");
    global $mysqli;
    $query = "SELECT * FROM product WHERE (productID = ?)";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("s", $prodID);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    return $row['productPrice'];
    $mysqli->close();
  }
}

class cart_product
{
  public $prod_id;
  public $quantity;
  public function __construct($prod_id, $quantity)
  {
    $this->prod_id = $prod_id;
    $this->quantity = $quantity;
  }
  public function get_quantity()
  {
    return $this->quantity;
  }
  public function add_quantity()
  {
    $this->quantity++;
  }
  public function add_quantityBy($quantity)
  {
    $this->quantity += $quantity;
  }

  public function remove_quantity($quantity)
  {
    $this->quantity--;
  }
  public function get_prodId()
  {
    return $this->prod_id;
  }
}

class cart_product_array
{
  var $products;
  var $depth;
  public function __construct()
  {
    $this->depth = 0;
    $this->products = array();
  }
  function add_product($product)
  {
    $this->products[$this->depth] = $product;
    $this->depth++;
  }
  function delete_product($index)
  {
    unset($this->products[$index]);
    $this->products = array_values($this->products);
    $this->depth--;
  }

  function get_depth()
  {
    return $this->depth;
  }

  function get_product($index)
  {
    return $this->products[$index];
  }
}

class cart
{
  var $cartID;
  var $custID;
  var $query;
  public function createCart(){
    $cartID = $_SESSION['cartID'];
    $custID = $_SESSION['custID'];
    include("conn_db.php");

    $query = "INSERT INTO cart (cartID, customerID) VALUES (?,?)";
    $stmt = $mysqli->prepare($query);
    echo $cartID;
    $stmt->bind_param("ss", $cartID, $custID);
    $stmt->execute();
    $mysqli->close();
  }
  public function buyItems($product_id, $quantity)
  {
    include("conn_db.php");
    $cartID = $_SESSION['cartID'];
    $query = "INSERT INTO cart_product (cartID, productID, quantity) VALUES (?,?,?)";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("sss", $cartID, $product_id, $quantity);
    $stmt->execute();
    $mysqli->close();
  }
}
