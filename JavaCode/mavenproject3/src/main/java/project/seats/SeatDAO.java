/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.seats;

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
public class SeatDAO {

    public List<SeatDTO> list(int theatreID) {
        List<SeatDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT [SeatID], [TheatreID], [Row], [Columnn], [Status], [ShowtimeID] FROM [dbo].[Seats] WHERE TheatreID = ? ";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, theatreID);
            rs = stmt.executeQuery();

            while (rs.next()) {

                SeatDTO seat = new SeatDTO();
                seat.setSeatID(rs.getInt("SeatID"));
                seat.setTheatreID(rs.getInt("TheatreID"));
                seat.setRow(rs.getString("Row"));
                seat.setColumn(rs.getInt("Columnn"));
                seat.setStatus(rs.getString("Status"));
                seat.setShowtimeID(rs.getInt("ShowtimeID"));

                list.add(seat);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }
    
    public List<SeatDTO> listByShowtimeID(int showtimeID) {
        List<SeatDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT [SeatID], [TheatreID], [Row], [Columnn], [Status], [ShowtimeID] FROM [dbo].[Seats] WHERE ShowtimeID = ? ";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, showtimeID);
            rs = stmt.executeQuery();

            while (rs.next()) {

                SeatDTO seat = new SeatDTO();
                seat.setSeatID(rs.getInt("SeatID"));
                seat.setTheatreID(rs.getInt("TheatreID"));
                seat.setRow(rs.getString("Row"));
                seat.setColumn(rs.getInt("Columnn"));
                seat.setStatus(rs.getString("Status"));
                seat.setShowtimeID(rs.getInt("ShowtimeID"));

                list.add(seat);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }
    
    public void updateSeatStatus(int seatID, String newStatus, int showtimeID) {
    Connection con = null;
    PreparedStatement stmt = null;

    try {
        con = DBUtils.getConnection();
        String sql = "UPDATE [dbo].[Seats] SET [Status] = ? WHERE [SeatID] = ? AND ShowtimeID = ? ";
        stmt = con.prepareStatement(sql);
        stmt.setString(1, newStatus);
        stmt.setInt(2, seatID);
        stmt.setInt(3, showtimeID);

        int rowsUpdated = stmt.executeUpdate();
        

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

    
    
}
