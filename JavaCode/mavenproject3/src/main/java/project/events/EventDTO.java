/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.events;

/**
 *
 * @author HAO
 */
public class EventDTO {

    private int eventID;
    private String name;
    private String runningTime;
    private String content;
    private String poster;
    private String condition;
    private String bannerImage;
    private String bannerStatus;

    // Constructor không tham số
    public EventDTO() {
    }

    // Constructor đầy đủ tham số
    public EventDTO(int eventID, String name, String runningTime, String content, String poster, String condition, String bannerImage, String bannerStatus) {
        this.eventID = eventID;
        this.name = name;
        this.runningTime = runningTime;
        this.content = content;
        this.poster = poster;
        this.condition = condition;
        this.bannerImage = bannerImage;
        this.bannerStatus = bannerStatus;
    }

    public String getBannerImage() {
        return bannerImage;
    }

    public void setBannerImage(String bannerImage) {
        this.bannerImage = bannerImage;
    }

    public String getBannerStatus() {
        return bannerStatus;
    }

    public void setBannerStatus(String bannerStatus) {
        this.bannerStatus = bannerStatus;
    }

    // Getters và Setters
    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRunningTime() {
        return runningTime;
    }

    public void setRunningTime(String runningTime) {
        this.runningTime = runningTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
