/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.cinemas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import project.utils.DBUtils;
import static project.utils.DBUtils.getConnection;

/**
 *
 * @author HAO
 */
public class CinemaDAO {

    public List<CinemaDTO> list() {
        List<CinemaDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM Cinema";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {

                CinemaDTO cinema = new CinemaDTO();
                cinema.setCinemaID(rs.getInt("CinemaID"));
                cinema.setName(rs.getString("Name"));
                cinema.setLocation(rs.getString("Location"));
                cinema.setNumberOfTheatres(rs.getInt("NumberOfTheatres"));
                cinema.setProvinceID(rs.getInt("ProvinceID"));

                list.add(cinema);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public List<CinemaDTO> list(int provinceID) {
        List<CinemaDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM Cinema WHERE ProvinceID = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, provinceID);
            rs = stmt.executeQuery();

            while (rs.next()) {

                CinemaDTO cinema = new CinemaDTO();
                cinema.setCinemaID(rs.getInt("CinemaID"));
                cinema.setName(rs.getString("Name"));
                cinema.setLocation(rs.getString("Location"));
                cinema.setNumberOfTheatres(rs.getInt("NumberOfTheatres"));
                cinema.setProvinceID(rs.getInt("ProvinceID"));

                list.add(cinema);
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
public CinemaDTO getCinemaById(int id) {
    CinemaDTO cinema = null;
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        con = DBUtils.getConnection();
        String sql = "SELECT * FROM Cinema WHERE CinemaID = ?";
        stmt = con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();

        if (rs.next()) {
            int userID = rs.getInt("CinemaID");
            String name = rs.getString("Name");
            String location = rs.getString("Location");
            int NumberOfTheatres = rs.getInt("NumberOfTheatres");
            int ProvinceID = rs.getInt("ProvinceID");
            
            cinema = new CinemaDTO(userID, name, location, NumberOfTheatres, ProvinceID);
 
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

    return cinema;
}

    
     public CinemaDTO getCinemaByID(int cinemaID) throws SQLException {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    CinemaDTO cinema = null;

    try {
        conn = getConnection();
        String query = "SELECT * FROM cinemas WHERE cinemaID = ?";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, cinemaID);
        rs = stmt.executeQuery();

        if (rs.next()) {
            int id = rs.getInt("cinemaID");
            String name = rs.getString("name");
            String location = rs.getString("location");
            int numberOfTheatres = rs.getInt("numberOfTheatres");
            int provinceID = rs.getInt("provinceID");
            cinema = new CinemaDTO(id, name, location, numberOfTheatres, provinceID);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        throw e;
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    return cinema;
}
    
    public void addCinema(CinemaDTO cinema) {
        String sql = "INSERT INTO Cinema(CinemaID, Name, Location, NumberOfTheatres, ProvinceID) VALUES(?, ?, ?, ?, ?)";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, cinema.getCinemaID());
            stmt.setString(2, cinema.getName());
            stmt.setString(3, cinema.getLocation());
            stmt.setInt(4, cinema.getNumberOfTheatres());
            stmt.setInt(5, cinema.getProvinceID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

public boolean updateCinema(CinemaDTO cinema) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "UPDATE Cinema SET Name = ?, Location = ?, NumberOfTheatres = ?, ProvinceID = ?  WHERE CinemaID = ?";
       try {
            conn = getConnection();
            if (conn != null) {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cinema.getName());
            stmt.setString(2, cinema.getLocation());
            stmt.setInt(3, cinema.getNumberOfTheatres());
            stmt.setInt(4, cinema.getCinemaID());
            stmt.setInt(5, cinema.getProvinceID());
            if (stmt.executeUpdate() > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
}

public void deleteCinema(int cinemaID) {
    Connection con = null;
    PreparedStatement stmt = null;

    try {
        con = DBUtils.getConnection();
        String sql = "DELETE FROM Cinema WHERE CinemaID = ?";
        stmt = con.prepareStatement(sql);
        stmt.setInt(1, cinemaID);
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

public int countCinemas() throws SQLException {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM Cinema"; // Adjust table name if necessary
        
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

