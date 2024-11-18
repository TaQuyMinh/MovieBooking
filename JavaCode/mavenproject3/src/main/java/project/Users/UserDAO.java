package project.Users;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import project.utils.DBUtils;

/**
 *
 * @author DUNGHUYNH
 */
public class UserDAO {

    public UserDTO login(String username, String password) {

        UserDTO user = null;

        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT username, Name FROM Users ";
            sql += " WHERE username = ?  AND Password = ?";

            if (con == null) {
                throw new SQLException("Không thể kết nối đến cơ sở dữ liệu.");
            }

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new UserDTO();
                user.setUsername(rs.getString("username"));
                user.setName(rs.getString("Name"));
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return user;

    }

    public boolean isUsernameExists(String username) throws SQLException {
        boolean exists = false;
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) AS count FROM Users WHERE username = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt("count");
                if (count > 0) {
                    exists = true;
                }
            }
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

        return exists;
    }

    public void registerUser(UserDTO user) throws SQLException {
        
        if (isUsernameExists(user.getUsername())) {
            throw new SQLException("Username already exists");
        }

      
        String sql = "INSERT INTO Users (Name, Email, PhoneNumber, Address, birthday, gender, username, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhoneNumber());
            pstmt.setString(4, user.getAddress());
            pstmt.setDate(5, new Date(user.getBirthday().getTime()));
            pstmt.setString(6, user.getGender());
            pstmt.setString(7, user.getUsername());
            pstmt.setString(8, user.getPassword());
            pstmt.executeUpdate();
        }
    }
    
    public UserDTO detail(String username) throws SQLException{
        UserDTO user = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM Users";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                if(username.equals(rs.getString("username"))){
                    int userID = rs.getInt("UserID");
                    String name = rs.getString("Name");
                    String email = rs.getString("Email");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String address = rs.getString("Address");
                    Date birthday = rs.getDate("birthday");
                    String gender = rs.getString("gender");
                    String password = rs.getString("password");

                    user = new UserDTO(userID, name, email, phoneNumber, address, birthday, gender, username, password);
                    return user;
                }
            }

            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;
    }
    public boolean update(UserDTO user){
        
       String sql = "UPDATE Users SET Name = ?, Email = ?, PhoneNumber = ?, Address = ?, birthday = ?, gender = ?, Password = ? WHERE username = ?";

        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setNString(1, user.getName());
            ps.setNString(2, user.getEmail());
            ps.setNString(3, user.getPhoneNumber());
            ps.setNString(4, user.getAddress());
            ps.setDate(5, user.getBirthday());
            ps.setNString(6, user.getGender());
            ps.setNString(7, user.getPassword());
            ps.setNString(8, user.getUsername());

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Update User error! " + ex.getMessage());
            ex.printStackTrace();
        }

        return false;

    }
public List<UserDTO> getAllUsers() throws SQLException {
        List<UserDTO> userList = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Users]";

        try {
             Connection con = DBUtils.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql);
             
            while (rs.next()) {
                int userID = rs.getInt("UserID");
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                String phoneNumber = rs.getString("PhoneNumber");
                String address = rs.getString("Address");
                Date birthday = rs.getDate("birthday");
                String gender = rs.getString("gender");
                String username = rs.getString("username");
                String password = rs.getString("Password");

                UserDTO user = new UserDTO(userID, name, email, phoneNumber, address, birthday, gender, username, password);
                userList.add(user);
            }
        } catch (SQLException ex) {
            System.out.println("get User error! " + ex.getMessage());
            ex.printStackTrace(); 
        }

        return userList;
    }
    
    public UserDTO getUserByID(int id) throws SQLException {
    UserDTO user = null;
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        con = DBUtils.getConnection();
        String sql = "SELECT * FROM Users WHERE UserID = ?";
        stmt = con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();

        if (rs.next()) {
            int userID = rs.getInt("UserID");
            String name = rs.getString("Name");
            String email = rs.getString("Email");
            String phoneNumber = rs.getString("PhoneNumber");
            String address = rs.getString("Address");
            Date birthday = rs.getDate("birthday");
            String gender = rs.getString("gender");
            String username = rs.getString("username");
            String password = rs.getString("password");

            user = new UserDTO(userID, name, email, phoneNumber, address, birthday, gender, username, password);
        }
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

    return user;
}
    
    public void deleteUser(int userID) {
    Connection con = null;
    PreparedStatement stmt = null;

    try {
        con = DBUtils.getConnection();
        String sql = "DELETE FROM Users WHERE UserID = ?";
        stmt = con.prepareStatement(sql);
        stmt.setInt(1, userID);
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

public int countUsers() throws SQLException {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM Users";
        
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

