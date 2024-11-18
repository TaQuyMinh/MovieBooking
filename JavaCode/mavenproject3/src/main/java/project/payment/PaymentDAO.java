/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.payment;

import java.sql.Connection;
import java.sql.Date;
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
public class PaymentDAO {

    public List<PaymentDTO> list() {
        List<PaymentDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT PaymentID, Amount, PaymentMethod, TicketID, UserID, DiscountID FROM Payment ";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                PaymentDTO payment = new PaymentDTO();
                payment.setPaymentID(rs.getInt("PaymentID"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setPaymentMethod(rs.getString("PaymentMethod"));
                payment.setTicketID(rs.getInt("TicketID"));
                payment.setUserID(rs.getInt("UserID"));
                payment.setDiscountID(rs.getInt("DiscountID"));
                list.add(payment);
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

    public void addPayment(double Amount, String PaymentMethod, int TicketID, int UserID) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = DBUtils.getConnection();
            String sql = "INSERT INTO Payment (Amount, PaymentMethod, TicketID, UserID)\n"
                    + "VALUES (?, ?, ?, ?); ";
            stmt = con.prepareStatement(sql);
            stmt.setDouble(1, Amount);
            stmt.setString(2, PaymentMethod);
            stmt.setInt(3, TicketID);
            stmt.setInt(4, UserID);

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

    

}
