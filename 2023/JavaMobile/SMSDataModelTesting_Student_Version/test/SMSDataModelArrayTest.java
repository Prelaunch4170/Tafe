
import java.util.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Andre
 */
public class SMSDataModelArrayTest {

    public static void main(String[] args) {
        SMSDataModelArray model = new SMSDataModelArray("Hello, World!");
        
        try {
            model.addPhoneNumber("1234567890");
            model.addPhoneNumber("9876543210");
            model.addPhoneNumber("5555555555");
            model.addPhoneNumber("1234567890"); // duplicate number
        } catch (SMSDataModelFullException e) {
            System.out.println("Model is full. Cannot add more phone numbers.");
        }

        System.out.println("Message: " + model.getMessage());

        String[] phoneNumbers = model.getPhoneNumbers();
        System.out.println("Phone Numbers:");
        for (String number : phoneNumbers) {
            if (number != null) {
                System.out.println(number);
            }
        }

        System.out.println("Phone number found at index: " + model.findPhoneNumberIndex("9876543210"));

        System.out.println("Phone number at index 2: " + model.getPhoneNumber(2));

        System.out.println("Updated phone number: " + model.updatePhoneNumber("9999999999", 1) + " To: 9999999999");

        System.out.println("Deleted phone number: " + model.deleteNumber(0));

        System.out.println("Number of phone numbers: " + model.getNumPhoneNumbers());
        System.out.println("Max number of phone numbers: " + model.getMaxNumPhoneNumbers());
        System.out.println("Is model full? " + model.isFull());
        System.out.println("Model: " + model);
    }
}
