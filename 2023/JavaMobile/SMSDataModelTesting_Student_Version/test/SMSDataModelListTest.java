/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Andre
 */
public class SMSDataModelListTest {
    public static void main(String[] args) {
        SMSDataModelList TestList = new SMSDataModelList("Test Message");

        try {
            TestList.addPhoneNumber("1234567890");
            TestList.addPhoneNumber("0427649274");
            TestList.addPhoneNumber("0454331567");
            TestList.addPhoneNumber("7777777777");
            TestList.addPhoneNumber("6283872535");
            TestList.addPhoneNumber("4843744984");
        } catch (SMSDataModelFullException e) {
            System.out.println("Model is full. Cannot add more phone numbers.");
        }

        // Get the phone numbers as an array and print them
        String[] phoneNumbers = TestList.getPhoneNumbers();
        System.out.println("Phone Numbers:");
        for (String number : phoneNumbers) {
            System.out.println(number);
        }
        // Expected output:
        // Phone Numbers:
        // 0410531436
        // 0427649274
        // 0454331567
        // 7777777777
        // 6283872535
        // 4843744984
        // Find the index of a phone number
        int index = TestList.findPhoneNumberIndex("0427649274");
        System.out.println("Index of '0427649274': " + index);
        // Expected output:
        // Index of '0427649274': 1

        // Update a phone number at a specific index
        String updatedNumber = TestList.updatePhoneNumber("0498765432", index);
        System.out.println("Updated number at index " + index + ": " + updatedNumber);
        // Expected output:
        // Updated number at index 1: 0427649274

        // Delete a phone number at a specific index
        String deletedNumber = TestList.deleteNumber(index);
        System.out.println("Deleted number at index " + index + ": " + deletedNumber);
        // Expected output:
        // Deleted number at index 1: 0498765432

        // Get the maximum number of phone numbers allowed
        int maxNumPhoneNumbers = TestList.getMaxNumPhoneNumbers();
        System.out.println("Maximum number of phone numbers: " + maxNumPhoneNumbers);
        // Expected output:
        // Maximum number of phone numbers: -1

        // Check if the model is full
        boolean isFull = TestList.isFull();
        System.out.println("Model is full: " + isFull);
        // Expected output:
        // Model is full: false

        // Get the message
        String message = TestList.getMessage();
        System.out.println("Message: " + message);
        // Expected output:
        // Message: Test Message

        // Set a new message
        TestList.setMessage("New message");
        message = TestList.getMessage();
        System.out.println("Updated message: " + message);
        // Expected output:
        // Updated message: New message
        //Testing sort method
        System.out.println("Model Test:  " + TestList);
        TestList.sortNumbers();
        System.out.println("Model Test:  " + TestList);
        //testing updating duplicate number
        System.out.println(TestList.updatePhoneNumber("6283872535", 4));
        System.out.println("Model Test:  " + TestList);
    }
}
