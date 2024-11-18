/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.Users.UserDAO;
import project.cinemas.CinemaDAO;
import project.movies.MovieDAO;
import project.ticket.TicketDAO;

@WebServlet(name = "DashboardController", urlPatterns = {"/DashboardController"})
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            UserDAO userDAO = new UserDAO();
            int userCount = userDAO.countUsers();
            
            CinemaDAO cinemaDAO = new CinemaDAO();
            int cinemaCount = cinemaDAO.countCinemas();
            
            MovieDAO movieDAO = new MovieDAO();
            int movieCount = movieDAO.countMovies();
            
            TicketDAO ticketDAO = new TicketDAO();
            int bookingCount = ticketDAO.countBookings();

            request.setAttribute("userCount", userCount);
            request.setAttribute("cinemaCount", cinemaCount);
            request.setAttribute("movieCount", movieCount);
            request.setAttribute("bookingCount", bookingCount);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}