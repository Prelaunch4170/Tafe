<?php

class product
{
  var $prod_id;
  var $prod_name;
  var $prod_desc;
  var $prod_img;
  var $prod_price;
  var $prod_amt;

  function __construct($prod_id, $prod_name, $prod_desc, $prod_img, $prod_price, $prod_amt)
  {
    $this->prod_id = $prod_id;
    $this->prod_name = $prod_name;
    $this->prod_desc = $prod_desc;
    $this->prod_img = $prod_img;
    $this->prod_price = $prod_price;
    $this->prod_amt = $prod_amt;
  }
  public function get_prod_id()
  {
    return $this->prod_id;
  }

  public function get_prod_name()
  {
    return $this->prod_name;
  }

  public function get_prod_desc()
  {
    return $this->prod_desc;
  }

  public function get_prod_img()
  {
    return $this->prod_img;
  }

  public function get_prod_price()
  {
    return $this->prod_price;
  }

  public function get_prod_amt()
  {
    return $this->prod_amt;
  }
}

class cart
{
  var $cartID;
  var $custID;
  public function create_cart($product_id)
  {
    include_once("../php/conn_db.php");
    session_start();
    global $mysqli;
    if (!isset($_SESSION['cartID'])) {

      $cartID = rand();
      $cartID = md5($cartID);
      $custID = $_SESSION['custID'];
      $query = "INSERT INTO cart (cartID, customerID) VALUES (?,?)";
      $stmt = $mysqli->prepare($query);
      $stmt->bind_param("ss", $cartID, $custID);
      $stmt->execute();

      $_SESSION['cartID'] = $cartID;

      $query = "INSERT INTO cart_product (cartID, productID, quantity) VALUES (?,?,1)";
      $stmt = $mysqli->prepare($query);
      $stmt->bind_param("ss", $cartID, $product_id);
      $stmt->execute();
    } else {

      $cartID = $_SESSION['cartID'];

      $query = "INSERT INTO cart_product (cartID, productID, quantity) VALUES (?,?,1)";
      try{$stmt = $mysqli->prepare($query);
        $stmt->bind_param("ss", $cartID, $product_id);
        $stmt->execute();
      }catch(Exception $e){
        $query = "SELECT quantity FROM cart_product WHERE cartID = ? AND productID = ?";
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param("ss", $cartID, $product_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $quantity = $row['quantity'];
        $quantity += 1;

        $query = "UPDATE cart_product SET quantity = ? WHERE cartID = ? AND productID = ?";
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param("sss", $quantity, $cartID, $product_id);
        $stmt->execute();
        $mysqli->close();
      }
    }
  }
}
