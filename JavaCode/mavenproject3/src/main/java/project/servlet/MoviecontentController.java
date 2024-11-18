/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.movies.MovieDAO;
import project.movies.MovieDTO;

/**
 *
 * @author HAO
 */
 
public class MoviecontentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String movieID = request.getParameter("movieID");

        try {
            if (action == null || action.equals("") || action.equals("moviecontent")) {
                if (movieID != null) {
                    MovieDAO dao = new MovieDAO();
                    MovieDTO movie = dao.getMovieByID(Integer.parseInt(movieID));
                    request.setAttribute("movie", movie);
                    request.getRequestDispatcher("moviecontent.jsp").forward(request, response);
                } else {
                    response.sendRedirect("movielist.jsp");
                }
            }

        } catch (Exception ex) {
            Logger.getLogger(MoviecontentController.class.getName()).log(Level.SEVERE, "Error processing request", ex);
            throw new ServletException("Error processing request", ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "MoviecontentController handles movie content actions and forwards to moviecontent.jsp";
    }
}

