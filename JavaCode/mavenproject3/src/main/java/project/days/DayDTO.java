/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.days;

import java.sql.Date;

/**
 *
 * @author HAO
 */
public class DayDTO {
    private int dayID;
    private Date date;
    private String dayName;

    public DayDTO() {
    }

    public DayDTO(int dayID, Date date, String dayName) {
        this.dayID = dayID;
        this.date = date;
        this.dayName = dayName;
    }

    public int getDayID() {
        return dayID;
    }

    public void setDayID(int dayID) {
        this.dayID = dayID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDayName() {
        return dayName;
    }

    public void setDayName(String dayName) {
        this.dayName = dayName;
    }
}
