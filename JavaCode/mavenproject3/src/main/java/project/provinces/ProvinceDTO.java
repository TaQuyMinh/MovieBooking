/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.provinces;

/**
 *
 * @author HAO
 */
public class ProvinceDTO {
    private int provinceID;
    private String name;
    private int numberOfCinema;

    public ProvinceDTO() {
    }

    
    public ProvinceDTO(int provinceID, String name, int numberOfCinema) {
        this.provinceID = provinceID;
        this.name = name;
        this.numberOfCinema = numberOfCinema;
    }

    // Getters and Setters
    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumberOfCinema() {
        return numberOfCinema;
    }

    public void setNumberOfCinema(int numberOfCinema) {
        this.numberOfCinema = numberOfCinema;
    }
}

