/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.Users.UserDAO;
import project.Users.UserDTO;

@WebServlet(name = "UserDetailServlet", urlPatterns = {"/detailUser"})
public class UserDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("id");

        UserDAO userDAO = new UserDAO();
        try {
            UserDTO user = userDAO.detail(username);
            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("/DetailUser.jsp").forward(request, response);
            } else {
                response.getWriter().println("User not found.");
            }
        } catch (SQLException ex) {
            throw new ServletException("Error retrieving user details", ex);
        }
    }
}
