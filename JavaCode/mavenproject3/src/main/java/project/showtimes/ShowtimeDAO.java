/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.showtimes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import project.utils.DBUtils;

/**
 *
 * @author HAO
 */
public class ShowtimeDAO {

    public List<ShowtimeDTO> list() {
        List<ShowtimeDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM Showtime s\n"
                    + "INNER JOIN Theatre t ON s.TheatreID = t.TheatreID\n"
                    + "INNER JOIN Cinema c ON t.CinemaID = c.CinemaID\n"
                    + "INNER JOIN Province p ON c.ProvinceID = p.ProvinceID\n"
                    + "ORDER BY StartTime ASC";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {

                ShowtimeDTO showtime = new ShowtimeDTO();
                showtime.setShowtimeID(rs.getInt("ShowtimeID"));
                showtime.setStartTime(rs.getTime("StartTime"));
                showtime.setMovieID(rs.getInt("MovieID"));
                showtime.setTheatreID(rs.getInt("TheatreID"));
                showtime.setDayID(rs.getInt("dayID"));
                showtime.setFormatID(rs.getInt("formatID"));
                showtime.setProvinceID(rs.getInt("ProvinceID"));
                showtime.setCinemaID(rs.getInt("CinemaID"));
                list.add(showtime);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }
}
