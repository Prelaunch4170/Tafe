/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaformobile;

/**
 * The garage class represents a collection of car objects.
 * It contains methods to add cars to the collection, search for a specific car by engine number,
 * retrieve a car object by index, and return a string representation of the garage object.
 * 
 * @author Andre
 */
public class garage {

    static final int GARAGE_SIZE = 10;
    private car[] cars;
    private int numberOfCars;

    /**
     * Constructor for the garage class that initializes a new array of car objects.
     */
    public garage() {
        cars = new car[GARAGE_SIZE];
    }

    /**
     * Method to add a new car object to the garage's array of car objects.
     * If the array is full, the method prints an error message.
     * 
     * @param newCar The new car object to add to the garage
     */
    public void addCarToGarage(car newCar) {
        if (numberOfCars < this.cars.length) {
            this.cars[numberOfCars] = newCar;
            numberOfCars++;
        } else {
            System.out.println("array full");
        }
        
    }

    /**
     * Method to search for a specific car object in the garage's array of car objects
     * based on its engine number. Returns the index of the car object if found,
     * or -1 if the car is not found.
     * 
     * @param carEngineNumber The engine number of the car object to search for
     * @return The index of the car object in the garage's array of car objects
     */
    public int findACar(String carEngineNumber){
        int carIndexInArray;
        for (int  i = 0; i < numberOfCars;i++){
                if(cars[i].getEngineNumber().equals(carEngineNumber)){
                    carIndexInArray = i;
                    return carIndexInArray;
                }
            }
        
        return -1;
    }

    /**
     * Method to retrieve a car object from the garage's array of car objects based on its index.
     * 
     * @param carIndexInArray The index of the car object to retrieve from the garage's array
     * @return The car object at the specified index
     */
    public String getCar(int carIndexInArray){
        return cars[carIndexInArray].toString();
    
    }
        
    /**
     * Returns a string representation of the garage object,
     * including each car object in the garage's array of car objects.
     * 
     * @return A string representation of the garage object
     */
    @Override
    public String toString(){
        String cars = "";
        for (int  i = 0; i < this.cars.length;i++){
            cars = cars + this.cars[i] + "\n";
        }
        return cars;
    }
}
