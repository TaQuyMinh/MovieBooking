/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.theatres;

/**
 *
 * @author HAO
 */
public class TheatreDTO {
    int theatreID;
    String name;
    String type;
    int capacity;
    int cinemaID;

    public TheatreDTO(int theatreID, String name, String type, int capacity, int cinemaID) {
        this.theatreID = theatreID;
        this.name = name;
        this.type = type;
        this.capacity = capacity;
        this.cinemaID = cinemaID;
    }

    public TheatreDTO() {
    }

    public int getTheatreID() {
        return theatreID;
    }

    public void setTheatreID(int theatreID) {
        this.theatreID = theatreID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getCinemaID() {
        return cinemaID;
    }

    public void setCinemaID(int cinemaID) {
        this.cinemaID = cinemaID;
    }
    
    
}
