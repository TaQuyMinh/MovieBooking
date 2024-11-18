/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.movies;

/**
 *
 * @author HAO
 */
import java.util.Date;
import java.util.List;

public class MovieDTO {

    private int movieID;
    private String title;
    private String description;
    private Date releaseDate;
    private int duration;
    private float rating;
    private String director;
    private String cast;
    private String genre;
    private String language;
    private String poster;
    private String trailer;
    private int viewOfMovie;
    private String bannerImage;
    private String bannerStatus;

    public MovieDTO(int movieID, String title, String description, Date releaseDate, int duration, float rating, String director, String cast, String genre, String language, String poster, String trailer, int viewOfMovie, String bannerImage, String bannerStatus) {
        this.movieID = movieID;
        this.title = title;
        this.description = description;
        this.releaseDate = releaseDate;
        this.duration = duration;
        this.rating = rating;
        this.director = director;
        this.cast = cast;
        this.genre = genre;
        this.language = language;
        this.poster = poster;
        this.trailer = trailer;
        this.viewOfMovie = viewOfMovie;
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

    public MovieDTO() {
    }

    // Getters and Setters
    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public int getViewOfMovie() {
        return viewOfMovie;
    }

    public void setViewOfMovie(int viewOfMovie) {
        this.viewOfMovie = viewOfMovie;
    }

    @Override
    public String toString() {
        return "MovieDTO{"
                + "movieID=" + movieID
                + ", title='" + title + '\''
                + ", description='" + description + '\''
                + ", releaseDate=" + releaseDate
                + ", duration=" + duration
                + ", rating=" + rating
                + ", director='" + director + '\''
                + ", cast=" + cast
                + ", genre='" + genre + '\''
                + ", language='" + language + '\''
                + ", poster='" + poster + '\''
                + ", trailer='" + trailer + '\''
                + '}';
    }
}
