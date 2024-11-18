/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import project.cinemas.CinemaDAO;
import project.cinemas.CinemaDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CinemaDetailController", urlPatterns = {"/CinemaDetailController"})
public class CinemaDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            CinemaDAO cinemaDAO = new CinemaDAO();
            CinemaDTO cinema = cinemaDAO.getCinemaById(Integer.parseInt(id));
            if (cinema != null) {
                request.setAttribute("cinema", cinema);
                request.getRequestDispatcher("DetailCinema.jsp").forward(request, response);
            } else {
                response.sendRedirect("Cinema.jsp?error=notfound");
            }
        } else {
            response.sendRedirect("Cinema.jsp?error=invalidid");
        }
    }
}