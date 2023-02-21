/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaformobile;

import abstractIntercasesample.vehicle;

/**
 * This class defines a car object with information about its engine size,
 * number of wheels, number of car seats, and engine number.
 *
 * @author Andre
 */
public class car extends vehicle{
    int engineSize;             // The size of the car's engine
    int numberOfWheels;         // The number of wheels on the car
    int numberOfCarSeats;       // The number of seats in the car
    String engineNumber;        // The engine number of the car
    
    // Default values for the engine size, number of wheels, and number of seats
    static final int DEF_ENGINE = 4;
    static final int DEF_WHEELS = 4;
    static final int DEF_SEATS = 4;
    
    /**
     * Constructor that takes in values for all instance variables
     * @param engineNo The engine number of the car
     * @param engineSize The size of the car's engine
     * @param numberOfWheels The number of wheels on the car
     * @param numberOfCarSeats The number of seats in the car
     */
    public car(String engineNo, int engineSize, int numberOfWheels, int numberOfCarSeats) {
        this.engineSize = engineSize;
        this.numberOfCarSeats = numberOfCarSeats;
        this.numberOfWheels = numberOfWheels;  
        this.engineNumber = engineNo;
    }

    @Override
    public String toString() {
        return "car {" + "engineSize=" + engineSize + ", numberOfWheels=" + numberOfWheels + ", numberOfCarSeats=" + numberOfCarSeats + ", engineNumber=" + engineNumber + '}';
    }
    /**
     * Constructor that sets default values for instance variables
     */
    public car() {
        this.engineSize = DEF_ENGINE;
        this.numberOfCarSeats = DEF_SEATS;
        this.numberOfWheels = DEF_WHEELS;
    }
    /**
     * Get the engine number of the car
     * @return The engine number of the car
     */
    public String getEngineNumber() {
        return engineNumber;
    }

    /**
     * Set the engine number of the car
     * @param engineNumber The engine number of the car
     */
    public void setEngineNumber(String engineNumber) {
        this.engineNumber = engineNumber;
    }

    /**
     * Get the size of the car's engine
     * @return The size of the car's engine
     */
    public int getEngineSize() {
        return engineSize;
    }

    /**
     * Set the size of the car's engine
     * @param engineSize The size of the car's engine
     */
    public void setEngineSize(int engineSize) {
        this.engineSize = engineSize;
    }

    /**
     * Get the number of wheels on the car
     * @return The number of wheels on the car
     */
    public int getNumberOfWheels() {
        return numberOfWheels;
    }

    /**
     * Set the number of wheels on the car
     * @param numberOfWheels The number of wheels on the car
     */
    public void setNumberOfWheels(int numberOfWheels) {
        this.numberOfWheels = numberOfWheels;
    }

    /**
     * Get the number of seats in the car
     * @return The number of seats in the car
     */
    public int getNumberOfCarSeats() {
        return numberOfCarSeats;
    }

    /**
     * Set the number of seats in the car
     * @param numberOfCarSeats The number of seats in the car
     */
    public void setNumberOfCarSeats(int numberOfCarSeats) {
        this.numberOfCarSeats = numberOfCarSeats;
    }

    @Override
    public String numberOfWheels() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public String getRunningEngine() {
        return super.runningEngine();
    }
}
