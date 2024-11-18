/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.cinemas;

/**
 *
 * @author HAO
 */
public class CinemaDTO {
    private int cinemaID;
    private String name;
    private String location;
    private int numberOfTheatres;
    private int provinceID;

    // Constructor

    public CinemaDTO() {
    }
    
    
    
    public CinemaDTO(int cinemaID, String name, String location, int numberOfTheatres, int provinceID) {
        this.cinemaID = cinemaID;
        this.name = name;
        this.location = location;
        this.numberOfTheatres = numberOfTheatres;
        this.provinceID = provinceID;
    }

    public int getCinemaID() {
        return cinemaID;
    }

    public void setCinemaID(int cinemaID) {
        this.cinemaID = cinemaID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getNumberOfTheatres() {
        return numberOfTheatres;
    }

    public void setNumberOfTheatres(int numberOfTheatres) {
        this.numberOfTheatres = numberOfTheatres;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }
}
