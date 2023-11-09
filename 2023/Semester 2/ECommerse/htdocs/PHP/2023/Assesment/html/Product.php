<?php

class product{
    var $prod_id;
    var $prod_name;
    var $prod_desc;
    var $prod_img;
    var $prod_price;
    var $prod_amt;

    function __construct($prod_id, $prod_name, $prod_desc, $prod_img, $prod_price, $prod_amt) {
        $this->prod_id = $prod_id;
        $this->prod_name = $prod_name;
        $this->prod_desc = $prod_desc;
        $this->prod_img = $prod_img;
        $this->prod_price = $prod_price;
        $this->prod_amt = $prod_amt;
    }
    public function get_prod_id() {
        return $this->prod_id;
      }
    
      public function get_prod_name() {
        return $this->prod_name;
      }
    
      public function get_prod_desc() {
        return $this->prod_desc;
      }
    
      public function get_prod_img() {
        return $this->prod_img;
      }
    
      public function get_prod_price() {
        return $this->prod_price;
      }
    
      public function get_prod_amt() {
        return $this->prod_amt;
      }
}


?>