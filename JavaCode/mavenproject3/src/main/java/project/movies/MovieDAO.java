package project.movies;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import project.utils.DBUtils;
import static project.utils.DBUtils.getConnection;

public class MovieDAO {

    public List<MovieDTO> list() {
        List<MovieDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM Movie";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {

                MovieDTO movie = new MovieDTO();
                movie.setMovieID(rs.getInt("MovieID"));
                movie.setTitle(rs.getString("Title"));
                movie.setDescription(rs.getString("Description"));
                movie.setReleaseDate(rs.getDate("ReleaseDate"));
                movie.setDuration(rs.getInt("Duration"));
                movie.setRating(rs.getInt("Rating"));
                movie.setDirector(rs.getString("Director"));
                movie.setCast(rs.getString("Cast"));
                movie.setGenre(rs.getString("Genre"));
                movie.setLanguage(rs.getString("Language"));
                movie.setPoster(rs.getString("poster"));
                movie.setTrailer(rs.getString("trailer"));
                movie.setViewOfMovie(rs.getInt("viewOfmovie"));
                movie.setBannerImage(rs.getString("bannerImage"));
                movie.setBannerStatus(rs.getString("bannerStatus"));
                list.add(movie);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public MovieDTO getMovieByID(int movieID) {
        MovieDTO movie = null;

        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM Movie WHERE MovieID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, movieID);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                movie = new MovieDTO();
                movie.setMovieID(rs.getInt("MovieID"));
                movie.setTitle(rs.getString("Title"));
                movie.setDescription(rs.getString("Description"));
                movie.setReleaseDate(rs.getDate("ReleaseDate"));
                movie.setDuration(rs.getInt("Duration"));
                movie.setRating(rs.getInt("Rating"));
                movie.setDirector(rs.getString("Director"));
                movie.setCast(rs.getString("Cast"));
                movie.setGenre(rs.getString("Genre"));
                movie.setLanguage(rs.getString("Language"));
                movie.setPoster(rs.getString("poster"));
                movie.setTrailer(rs.getString("trailer"));
                movie.setViewOfMovie(rs.getInt("viewOfmovie"));
                movie.setBannerImage(rs.getString("bannerImage"));
                movie.setBannerStatus(rs.getString("bannerStatus"));
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return movie;
    }
    


    public void addMovie(MovieDTO movie) {
        String sql = "INSERT INTO Movie (MovieID, Title, Description, ReleaseDate, Duration, Rating, Director, Cast, Genre, Language, poster, trailer, viewOfMovie, bannerImage, bannerStatus ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?, ?)";

        try (Connection con = DBUtils.getConnection();
                PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, movie.getMovieID());
            stmt.setString(2, movie.getTitle());
            stmt.setString(3, movie.getDescription());
            stmt.setDate(4, new java.sql.Date(movie.getReleaseDate().getTime()));
            stmt.setInt(5, movie.getDuration());
            stmt.setFloat(6, (float) movie.getRating());
            stmt.setString(7, movie.getDirector());
            stmt.setString(8, movie.getCast());
            stmt.setString(9, movie.getGenre());
            stmt.setString(10, movie.getLanguage());
            stmt.setString(11, movie.getPoster());
            stmt.setString(12, movie.getTrailer());
            stmt.setInt(13, movie.getViewOfMovie());
            stmt.setString(14, movie.getBannerImage());
            stmt.setString(15, movie.getBannerStatus());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


    public boolean updateMovie(MovieDTO movie) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " UPDATE Movie SET [Title]=?, [Description]=?, [ReleaseDate]=?, [Duration]=?, [Rating]=?, [Director]=?, [Cast]=?, [Genre]=?, [Language]=?, [poster]=?, [trailer]=?, [viewOfmovie]=?, [bannerImage]=?, [bannerStatus]=? WHERE [MovieID]=? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, movie.getTitle());
                pst.setString(2, movie.getDescription());
                pst.setDate(3, (Date) movie.getReleaseDate());
                pst.setInt(4, movie.getDuration());
                pst.setFloat(5, (float) movie.getRating());
                pst.setString(6, movie.getDirector());
                pst.setString(7, movie.getCast());
                pst.setString(8, movie.getGenre());
                pst.setString(9, movie.getLanguage());
                pst.setString(10, movie.getPoster());
                pst.setString(11, movie.getTrailer());
                pst.setInt(12, movie.getViewOfMovie());
                pst.setString(13, movie.getBannerImage());
                pst.setString(14, movie.getBannerStatus());
                pst.setInt(15, movie.getMovieID());
                pst.executeUpdate();
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    return false;
}

public void deleteMovie(int movieID) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = DBUtils.getConnection();
            String sql = "DELETE FROM Movie WHERE MovieID = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, movieID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


public int countMovies() throws SQLException {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM Movie"; // Adjust table name if necessary
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return count;
    }

 public boolean updateView(int movieID) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "UPDATE Movie\n"
                        + "SET viewOfmovie = viewOfmovie + (\n"
                        + "     SELECT SUM(LEN(t.SeatName) - LEN(REPLACE(t.SeatName, ',', '')) + 1)\n"
                        + "    FROM Ticket t\n"
                        + "    JOIN Showtime s ON t.ShowtimeID = s.ShowtimeID\n"
                        + "    WHERE s.MovieID = Movie.MovieID\n"
                        + "      AND (t.isCounted = 0 OR t.isCounted is null)\n"
                        + ")"
                        + "WHERE MovieID = ? ";

                
                pst = con.prepareStatement(sql);
                pst.setInt(1, movieID);
                int rowsUpdated = pst.executeUpdate();

                return rowsUpdated > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

}
