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
import project.cinemas.CinemaDAO;
import project.cinemas.CinemaDTO;

@WebServlet("/CinemaDetailUpdate")
public class CinemaDetailUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cinemaID = Integer.parseInt(request.getParameter("id"));
        CinemaDAO cinemaDAO = new CinemaDAO();
        try {
            CinemaDTO cinema = cinemaDAO.getCinemaByID(cinemaID);
            request.setAttribute("cinema", cinema);
            request.getRequestDispatcher("UpdateCinema.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Cinema.jsp?error=notfound");
        }
    }
}
