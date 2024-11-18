/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.days;

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
public class DayDAO {
    public List<DayDTO> list() {
        List<DayDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM day";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                DayDTO day = new DayDTO();
                day.setDayID(rs.getInt("dayID"));
                day.setDate(rs.getDate("date"));
                day.setDayName(rs.getString("dayName"));
               
                list.add(day);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return list;
    }
}
