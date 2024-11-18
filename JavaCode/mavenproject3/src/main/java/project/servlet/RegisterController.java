/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

/**
 *
 * @author HAO
 */
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Date; // Import java.sql.Date
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.Users.UserDAO;
import project.Users.UserDTO;
import project.utils.DBUtils;

public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // In the servlet's doPost or doGet method
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Lấy thông tin từ form đăng ký
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("Password");
        String gender = request.getParameter("gender");

        // Xử lý ngày sinh
        int day = Integer.parseInt(request.getParameter("dob-day"));
        int month = Integer.parseInt(request.getParameter("dob-month"));
        int year = Integer.parseInt(request.getParameter("dob-year"));

        // Tạo đối tượng java.util.Date từ ngày, tháng, năm
        java.util.Date utilDate = new java.util.Date(year - 1900, month - 1, day);

        // Chuyển đổi sang java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

        // Tạo đối tượng UserDTO
        UserDTO user = new UserDTO();
        user.setUserID(0);
        user.setName(name);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setAddress(address);
        user.setBirthday(sqlDate); // Gán ngày sinh đã chuyển đổi
        user.setUsername(username);
        user.setPassword(password);
        user.setGender(gender);

        // Gọi DAO để thực hiện thêm vào cơ sở dữ liệu
        UserDAO userDao = new UserDAO();
        try {
            if (userDao.isUsernameExists(username)) {
                throw new SQLException("Tên đăng nhập đã tồn tại");
            }
            userDao.registerUser(user);
            // Nếu đăng ký thành công, có thể redirect đến trang thông báo thành công
            request.setAttribute("error", "Đăng ký thành công! Vui lòng đăng nhập để tiếp tục");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (SQLException ex) {
            // Xử lý nếu có lỗi khi thêm vào cơ sở dữ liệu
            request.setAttribute("error", "Đã xảy ra lỗi khi đăng ký: " + ex.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
