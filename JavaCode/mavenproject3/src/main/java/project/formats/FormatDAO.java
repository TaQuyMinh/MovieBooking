/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.formats;

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
public class FormatDAO {
    public List<FormatDTO> list() {
        List<FormatDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM format";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                FormatDTO format = new FormatDTO();
                format.setFormatID(rs.getInt("formatID"));
                format.setFormatName(rs.getString("formatName"));
               
                list.add(format);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return list;
    }
}
