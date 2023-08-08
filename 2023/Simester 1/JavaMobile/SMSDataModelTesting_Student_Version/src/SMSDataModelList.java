
import java.io.Serializable;
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
public class SMSDataModelList implements SMSDataModelInterface, Serializable {

    private static final long serialVersionUID = 1L;
    public static final String FULL = "FULL";
    public static final String DUPLICATE = "DUPLICATE";
    private int maxNumPhoneNumbers = -1;
    private String message;                 // The SMS message
    private ArrayList<String> phoneNumbers;      // The collection of phone numbers

    public SMSDataModelList(String message) {
        this(message, -1);
    }

    public SMSDataModelList() {
        this("", -1);

    }

    public SMSDataModelList(String initialMessage, int maxNumPhoneNumbers) {
        this.message = initialMessage;
        if(maxNumPhoneNumbers == -1){
            this.phoneNumbers = new ArrayList<>();
        }else{
            this.phoneNumbers = new ArrayList<>(maxNumPhoneNumbers);
        }
        this.maxNumPhoneNumbers = maxNumPhoneNumbers;

    }

    @Override
    public String addPhoneNumber(String newPhoneNumber) throws SMSDataModelFullException {
        String result;

        if (phoneNumbers.size() == this.maxNumPhoneNumbers) {
            result = FULL;
        } else {
            boolean exists = phoneNumbers.contains(newPhoneNumber);
            if (exists) {
                result = DUPLICATE;
            } else {
                phoneNumbers.add(newPhoneNumber);
                result = newPhoneNumber;
            }
        }
        return result;
    }

    @Override
    public int findPhoneNumberIndex(String targetNumber) {
        return phoneNumbers.indexOf(targetNumber);
    }

    @Override
    public String updatePhoneNumber(String newPhoneNumber, int i) {
        String result;
        if (phoneNumbers.contains(newPhoneNumber)) {
            return "Number: " + newPhoneNumber + " already exists, cannot update";
        } else {

            if (i < 0 || i >= phoneNumbers.size()) {
                result = null;
            } else {
                result = phoneNumbers.get(i) + "was changed to " + newPhoneNumber;
                phoneNumbers.set(i, newPhoneNumber);
            }
            return result;
        }
    }

    public String getPhoneNumbersList(int i) {
        if (i < 0 || i >= phoneNumbers.size()) {
            return null;
        } else {
            return phoneNumbers.get(i);
        }
    }

    @Override
    public String deleteNumber(int i) {
        String result;
        if (i < 0 || i >= phoneNumbers.size()) {
            result = null;
        } else {
            result = phoneNumbers.get(i);
            phoneNumbers.remove(i);
        }
        return result;
    }

    @Override
    public int getMaxNumPhoneNumbers() {

        if (this.maxNumPhoneNumbers == -1) {
            return -1; // Unlimited size
        } else {
            return phoneNumbers.size();
        }
    }

    @Override
    public boolean isFull() {
        return this.maxNumPhoneNumbers == phoneNumbers.size();
    }

    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public void setMessage(String mMessage) {
        this.message = mMessage;
    }

    @Override
    public String[] getPhoneNumbers() {

        String[] convert = new String[phoneNumbers.size()];
        convert = phoneNumbers.toArray(convert);
        return convert;
    }

    @Override
    public int getNumPhoneNumbers() {
        return phoneNumbers.size();
    }

    @Override
    public String toString() {
        return "SMSDataModel [message=" + message + ", phoneNumbers="
                + phoneNumbers + ", number of phone numbers="
                + phoneNumbers.size() + "]";
    }

    @Override
    public void sortNumbers() {
        Collections.sort(phoneNumbers);
    }

    @Override
    public String getPhoneNumber(int i) {
        String result;

        if (i < 0 || i >= phoneNumbers.size()) {
            result = null;
        } else {
            result = phoneNumbers.get(i);
        }
        return result;
    }

    public LinkedList<String> ConvertToLinkedList(String[] aL) {
        LinkedList<String> lL = new LinkedList<>(Arrays.asList(aL));
        return lL;
    }
    

}