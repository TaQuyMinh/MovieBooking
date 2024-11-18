/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.transaction;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author HAO
 */
public class TransactionDTO {
    private String title;
    private int ticketID;
    private String seatName;
    private Date purchaseDate;
    private Time startTime;
    private Date showtimeDate;
    private double amount;
    private String paymentMethod;

    public TransactionDTO() {
    }

    public TransactionDTO(String title, int ticketID, String seatName, Date purchaseDate, Time startTime, Date showtimeDate, double amount, String paymentMethod) {
        this.title = title;
        this.ticketID = ticketID;
        this.seatName = seatName;
        this.purchaseDate = purchaseDate;
        this.startTime = startTime;
        this.showtimeDate = showtimeDate;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }



    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public Date getShowtimeDate() {
        return showtimeDate;
    }

    public void setShowtimeDate(Date showtimeDate) {
        this.showtimeDate = showtimeDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    
    
}
