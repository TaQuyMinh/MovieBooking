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

        
public class UpdateCinemaController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if ("UpdateCinema".equals(action)) {
            int cinemaID = Integer.parseInt(request.getParameter("id"));
            CinemaDAO cinemaDAO = new CinemaDAO();
            CinemaDTO cinema = cinemaDAO.getCinemaById(cinemaID);
            request.setAttribute("cinema", cinema);
            request.getRequestDispatcher("UpdateCinema.jsp").forward(request, response);
        } else if ("SaveCinemaEdit".equals(action)) {
            try {
                int cinemaID = Integer.parseInt(request.getParameter("cinemaID"));
                String name = request.getParameter("newCinemaName");
                String location = request.getParameter("newCinemaLocation");
                int numberOfTheatres = Integer.parseInt(request.getParameter("newNumberOfTheatres"));
                int provinceID = Integer.parseInt(request.getParameter("newProvinceID"));
                CinemaDTO cinema = new CinemaDTO(cinemaID, name, location, numberOfTheatres, provinceID);
                CinemaDAO cinemaDAO = new CinemaDAO();
                cinemaDAO.updateCinema(cinema);
            } catch (SQLException e) {
                log("Error at UpdateCinemaController: " + e.toString());
            } finally {
                request.getRequestDispatcher("CinemaListController").forward(request, response);
                
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        processRequest(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        processRequest(request, response);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

