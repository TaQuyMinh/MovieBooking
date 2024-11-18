package project.ticket;

import java.sql.Date;

public class TicketDTO {
    private int ticketID;
    private String seatName;
    private Date purchaseDate;
    private double price;
    private int userID;
    private int showtimeID;
    private int isCounted;

    public TicketDTO() {
    }

    public TicketDTO(int ticketID, String seatName, Date purchaseDate, double price, int userID, int showtimeID, int isCounted) {
        this.ticketID = ticketID;
        this.seatName = seatName;
        this.purchaseDate = purchaseDate;
        this.price = price;
        this.userID = userID;
        this.showtimeID = showtimeID;
        this.isCounted = isCounted;
    }

    public int getIsCounted() {
        return isCounted;
    }

    public void setIsCounted(int isCounted) {
        this.isCounted = isCounted;
    }

   

    public int getTicketID() {
        return ticketID;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatNumber) {
        this.seatName = seatNumber;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getShowtimeID() {
        return showtimeID;
    }

    public void setShowtimeID(int showtimeID) {
        this.showtimeID = showtimeID;
    }
}
