<?php

class Product {

    var $product_id;
    var $product_name;
    var $qty;
    var $unit_price;
	
    function get_product_cost() {
        return $this->qty * $this->unit_price;
    }
	
    function __construct($product_id, $product_name, $qty, $unit_price) {
        $this->product_id = $product_id;
        $this->product_name = $product_name;
        $this->qty = $qty;
        $this->unit_price = $unit_price;
    }
    

    function get_product_id() {
        return $this->product_id;
    }

    function get_product_name() {
        return $this->product_name;
    }

    function get_qty() {
        return $this->qty;
    }

    function get_unit_price() {
        return $this->unit_price;
    }

}

class Cart {

    var $products;
    var $depth;

    function __construct() {
        $this->products = array();
        $this->depth = 0;
    }

    function add_product($product) {
        $this->products[$this->depth] = $product;
        $this->depth++;
    }

    function delete_product($index){
        unset($this->products[$index]);
        $this->products = array_values($this->products);
        $this->depth--;
    }

    function get_depth() {
        return $this->depth;
    }

    function get_product($index) {
        return $this->products[$index];
    }

}

?>