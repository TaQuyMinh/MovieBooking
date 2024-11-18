/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.banners;

/**
 *
 * @author HAO
 */
public class BannerDTO {
    private String bannerImage;
    private int bannerID;

    public BannerDTO() {
    }

    public BannerDTO(String bannerImage, int bannerID) {
        this.bannerImage = bannerImage;
        this.bannerID = bannerID;
    }

    public String getBannerImage() {
        return bannerImage;
    }

    public void setBannerImage(String bannerImage) {
        this.bannerImage = bannerImage;
    }

    public int getBannerID() {
        return bannerID;
    }

    public void setBannerID(int bannerID) {
        this.bannerID = bannerID;
    }
    
    
}
