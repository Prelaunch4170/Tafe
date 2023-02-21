/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaformobile;

/**
 *
 * @author Andre
 */
public class JavaForMobile {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        car c1 = new car("CVB1",2,2,2);
        System.out.println(c1.runningEngine());
        garage g1 = new garage();
        
        car c2 = new car("KJH2",8,6,10);
        
        
        g1.addCarToGarage(c1);
        g1.addCarToGarage(c2);
        System.out.println(g1);
        
        System.out.println(g1.findACar("KJH2"));
        System.out.println(g1.getCar(g1.findACar("KJH2")));
    }
    
}
