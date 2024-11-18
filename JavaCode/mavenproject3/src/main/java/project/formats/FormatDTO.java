/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.formats;

/**
 *
 * @author HAO
 */
public class FormatDTO {
    private int formatID;
    private String formatName;

    public FormatDTO() {
    }

    public FormatDTO(int formatID, String formatName) {
        this.formatID = formatID;
        this.formatName = formatName;
    }

    public int getFormatID() {
        return formatID;
    }

    public void setFormatID(int formatID) {
        this.formatID = formatID;
    }

    public String getFormatName() {
        return formatName;
    }

    public void setFormatName(String formatName) {
        this.formatName = formatName;
    }

    @Override
    public String toString() {
        return "FormatDTO{" +
                "formatID=" + formatID +
                ", formatName='" + formatName + '\'' +
                '}';
    }
}

