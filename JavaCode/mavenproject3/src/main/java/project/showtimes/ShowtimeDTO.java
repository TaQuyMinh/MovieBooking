/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.showtimes;

import java.sql.Time;
import java.time.LocalDateTime;

/**
 *
 * @author HAO
 */
public class ShowtimeDTO {
    private int showtimeID;
    private Time startTime;
    private int movieID;
    private int theatreID;
    private int dayID;
    private int formatID;
    private int provinceID;
    private int cinemaID;

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public int getCinemaID() {
        return cinemaID;
    }

    public void setCinemaID(int cinemaID) {
        this.cinemaID = cinemaID;
    }


    public ShowtimeDTO(int showtimeID, Time startTime, int movieID, int theatreID, int dayID, int formatID, int provinceID, int cinemaID) {
        this.showtimeID = showtimeID;
        this.startTime = startTime;
        this.movieID = movieID;
        this.theatreID = theatreID;
        this.dayID = dayID;
        this.formatID = formatID;
        this.provinceID = provinceID;
        this.cinemaID = cinemaID;
    }

    public ShowtimeDTO() {
    }

    // Getters and setters
    public int getShowtimeID() {
        return showtimeID;
    }

    public void setShowtimeID(int showtimeID) {
        this.showtimeID = showtimeID;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public int getTheatreID() {
        return theatreID;
    }

    public void setTheatreID(int theatreID) {
        this.theatreID = theatreID;
    }

    public int getDayID() {
        return dayID;
    }

    public void setDayID(int dayID) {
        this.dayID = dayID;
    }

    public int getFormatID() {
        return formatID;
    }

    public void setFormatID(int formatID) {
        this.formatID = formatID;
    }
}
