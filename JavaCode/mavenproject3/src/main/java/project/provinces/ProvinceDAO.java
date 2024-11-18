/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.provinces;

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
public class ProvinceDAO {

    public List<ProvinceDTO> list() {
        List<ProvinceDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM Province";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                ProvinceDTO province = new ProvinceDTO();
                province.setProvinceID(rs.getInt("ProvinceID"));
                province.setName(rs.getString("Name"));
                province.setNumberOfCinema(rs.getInt("NumberOfCinema"));

                list.add(province);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }
}
