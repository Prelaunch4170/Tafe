/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Andre
 */
public class logins {
    public String firstName;
    public String lastName;
    public String Email;
    public String[] progLanguage;    
    public String notify;

    private String DEF_FIRSTNAME = "N/A";
    private String DEF_LASTNAME = "N/A";
    private String DEF_EMAIL = "N/A";
    private String[] DEF_PROGLANGUAGE;    
    private String DEF_NOTIFY = "N/A";

    public logins() {
        this.firstName = DEF_FIRSTNAME;
        this.lastName = DEF_LASTNAME;
        this.Email = DEF_EMAIL;
        this.progLanguage = DEF_PROGLANGUAGE;
        this.notify = DEF_NOTIFY;
    }

    public logins(String firstName, String lastName, String Email, String[] progLanguage, String notify) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.Email = Email;
        this.progLanguage = progLanguage;
        this.notify = notify;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return Email;
    }

    public String[] getProgLanguage() {
        return progLanguage;
    }

    public String getNotify() {
        return notify;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setProgLanguage(String[] progLanguage) {
        this.progLanguage = progLanguage;
    }

    public void setNotify(String notify) {
        this.notify = notify;
    }

    @Override
    public String toString() {
        return "logins{" + "firstName=" + firstName + ", lastName=" + lastName + ", Email=" + Email + ", progLanguage=" + progLanguage + ", notify=" + notify + '}';
    }
    
    
}
