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
public class Member {
    private String memberID;
    private String memberName;

    public Member(String memberID, String memberName) {
        this.memberID = memberID;
        this.memberName = memberName;
    }

    public String getMemberID() {
        return memberID;
    }

    public String getMemberName() {
        return memberName;
    }
    
    
}
