<?php
class Bank_Account{
    public $accNumber;
    public $custName;
    public $accType;
    public $balance;

    public function __construct($accNumber, $custName, $accType, $balance){
        $this->accNumber = $accNumber;
        $this->custName = $custName;
        $this->accType = $accType;
        $this->balance = $balance;
    }
    public function get_Number(){
        return $this->accNumber;
    }
    public function get_Name(){
        return $this->custName;
    }
    public function get_Type(){
        return $this->accType;
    }
    public function get_Balance(){
        return $this->balance;
    }
    public function set_Number($accNumber){
        $this->accNumber = $accNumber;
    }
    public function set_Name($custName){
        $this->custName = $custName;
    }
    public function set_Type($Type){
        $this->accType = $Type;
    }
    public function set_balance($balance){
        $this->balance = $balance;
    }
    public function get_details(){
        return $this->accNumber." ".$this->custName." ".$this->accType." ".$this->balance;
    }


}

?>