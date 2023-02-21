/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abstractIntercasesample;

/**
 *
 * @author Andre
 */
public abstract class vehicle implements machine{
    public abstract String numberOfWheels();
    
    public String runningEngine(){
        String hasEngine = hasEngine();
        return "It has  running engine: " + runningEngine;
    }    
}
