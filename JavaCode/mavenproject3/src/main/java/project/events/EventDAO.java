/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.events;

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
public class EventDAO {

    public List<EventDTO> list() {
        List<EventDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM Event";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                EventDTO event = new EventDTO();
                event.setEventID(rs.getInt("EventID"));
                event.setName(rs.getString("Name"));
                event.setRunningTime(rs.getString("RunningTime"));
                event.setContent(rs.getString("Content"));
                event.setCondition(rs.getString("Condition"));
                event.setPoster(rs.getString("Poster"));
                event.setBannerImage(rs.getString("bannerImage"));
                event.setBannerStatus(rs.getString("bannerStatus"));
                list.add(event);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public EventDTO getEventByID(int eventID) {
        EventDTO event = null;

        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM Event WHERE EventID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, eventID);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                event = new EventDTO();
                event.setEventID(rs.getInt("EventID"));
                event.setName(rs.getString("Name"));
                event.setRunningTime(rs.getString("RunningTime"));
                event.setContent(rs.getString("Content"));
                event.setCondition(rs.getString("Condition"));
                event.setPoster(rs.getString("Poster"));
                event.setBannerImage(rs.getString("bannerImage"));
                event.setBannerStatus(rs.getString("bannerStatus"));
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return event;
    }
}
