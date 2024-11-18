/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.theatres;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import project.utils.DBUtils;

/**
 *
 * @author HAO
 */
public class TheatreDAO {
    public List<TheatreDTO> list(int cinemaID){
        List<TheatreDTO> list =  new ArrayList<>();
        Connection con = null; 
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            con = DBUtils.getConnection();
        
        } catch (Exception e) {
        }
    return null;}
}
