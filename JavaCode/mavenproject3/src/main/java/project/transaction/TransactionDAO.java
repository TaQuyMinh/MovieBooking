/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import project.payment.PaymentDTO;
import project.utils.DBUtils;

/**
 *
 * @author HAO
 */
public class TransactionDAO {

    public List<TransactionDTO> transaction(int userID) {
        List<TransactionDTO> list = new ArrayList<>();

        
        try (Connection con = DBUtils.getConnection();
                PreparedStatement stmt = con.prepareStatement(
                        "SELECT m.Title, t.TicketID, t.SeatName, t.PurchaseDate, d.date, p.Amount, p.PaymentMethod, s.StartTime "
                        + "FROM Payment p INNER JOIN Ticket t ON p.TicketID = t.TicketID "
                        + "INNER JOIN Showtime s ON s.ShowtimeID = t.ShowtimeID "
                        + "INNER JOIN Movie m ON m.MovieID = s.MovieID "
                        + "INNER JOIN day d ON d.dayID = s.dayID "
                        + "WHERE p.UserID = ?")) {

            stmt.setInt(1, userID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    TransactionDTO transaction = new TransactionDTO();
                    transaction.setTitle(rs.getString("Title"));
                    transaction.setTicketID(rs.getInt("TicketID"));
                    transaction.setSeatName(rs.getString("SeatName"));
                    transaction.setPurchaseDate(rs.getDate("PurchaseDate"));
                    transaction.setShowtimeDate(rs.getDate("date"));
                    transaction.setAmount(rs.getDouble("Amount"));
                    transaction.setPaymentMethod(rs.getString("PaymentMethod"));
                    transaction.setStartTime(rs.getTime("StartTime"));
                    list.add(transaction);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }
}
