/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.seats;

/**
 *
 * @author HAO
 */
public class SeatDTO {
    private int seatID;
    private int theatreID;
    private String row;
    private int column;
    private String status;
    private int showtimeID;

    public SeatDTO() {
    }

    // Constructor
    public SeatDTO(int seatID, int theatreID, String row, int column, String status, int showtimeID) {
        this.seatID = seatID;
        this.theatreID = theatreID;
        this.row = row;
        this.column = column;
        this.status = status;
        this.showtimeID = showtimeID;
    }

    // Getters and Setters
    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public int getTheatreID() {
        return theatreID;
    }

    public void setTheatreID(int theatreID) {
        this.theatreID = theatreID;
    }

    public String getRow() {
        return row;
    }

    public void setRow(String row) {
        this.row = row;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getShowtimeID() {
        return showtimeID;
    }

    public void setShowtimeID(int showtimeID) {
        this.showtimeID = showtimeID;
    }

    @Override
    public String toString() {
        return "SeatDTO{" +
                "seatID=" + seatID +
                ", theatreID=" + theatreID +
                ", row='" + row + '\'' +
                ", column=" + column +
                ", status='" + status + '\'' +
                ", showtimeID='" + showtimeID + '\'' +
                '}';
    }
}
