/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author dalevanh
 */
public class Item {

    private String itemID;
    private String itemName;

    public Item(String itemID, String itemName) {
        this.itemID = itemID;
        this.itemName = itemName;
    }

    public String getItemID() {
        return itemID;
    }

    public String getItemName() {
        return itemName;
    }

}
