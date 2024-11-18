package project.ticket;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import project.utils.DBUtils;

public class TicketDAO {

    public List<TicketDTO> list() {
        List<TicketDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT TicketID,UserID,SeatName, PurchaseDate,Price, ShowtimeID, isCounted FROM Ticket";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                TicketDTO ticket = new TicketDTO();
                ticket.setTicketID(rs.getInt("TicketID"));
                ticket.setUserID(rs.getInt("UserID"));
                ticket.setSeatName(rs.getString("SeatName"));
                ticket.setPurchaseDate(rs.getDate("PurchaseDate"));
                ticket.setPrice(rs.getDouble("Price"));
                ticket.setShowtimeID(rs.getInt("ShowtimeID"));
                ticket.setIsCounted(rs.getInt("isCounted"));

                list.add(ticket);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return list;
    }

    public TicketDTO getTicketById(int id) {
        TicketDTO ticket = null;
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT TicketID,UserID,SeatName, PurchaseDate,Price, ShowtimeID, isCounted FROM Ticket WHERE TicketID = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int TicketID = rs.getInt("TicketID");
                String seatName = rs.getString("SeatName");
                Date purchaseDate = rs.getDate("PurchaseDate");
                double price = rs.getDouble("Price");
                int userID = rs.getInt("UserID");
                int showtimeID = rs.getInt("ShowtimeID");
                int isCounted = rs.getInt("isCounted");

                ticket = new TicketDTO(TicketID, seatName, purchaseDate, price, userID, showtimeID, isCounted);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return ticket;
    }

    public void deleteTicket(int ticketID) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = DBUtils.getConnection();
            String sql = "DELETE FROM Ticket WHERE TicketID = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, ticketID);
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

    public void addTicket(String seatNumber, Date purchaseDate, double price, int userID, int showtimeID) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = DBUtils.getConnection();
            String sql = "INSERT INTO ticket (SeatName, PurchaseDate, Price, UserID, ShowtimeID)\n"
                    + "VALUES (?, ?, ?, ?, ?); ";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, seatNumber);
            stmt.setDate(2, purchaseDate);
            stmt.setDouble(3, price);
            stmt.setInt(4, userID);
            stmt.setInt(5, showtimeID);

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

    public void countViewByTicket() {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "UPDATE Ticket\n"
                        + "SET isCounted = 1\n"
                        + "WHERE isCounted = 0 OR isCounted is NULL;";
                stmt = con.prepareStatement(sql);
                int rowsUpdated = stmt.executeUpdate();
                System.out.println("Updated " + rowsUpdated + " rows."); // Optional: Print the number of rows updated
            }
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

    public int countBookings() throws SQLException {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM Ticket"; // Adjust table name if necessary

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

}
