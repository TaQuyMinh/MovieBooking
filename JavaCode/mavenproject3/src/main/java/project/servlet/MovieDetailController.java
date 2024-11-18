/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.movies.MovieDAO;
import project.movies.MovieDTO;

/**
 *
 * @author PC
 */
@WebServlet(name = "MovieDetailController", urlPatterns = {"/MovieDetailController"})
public class MovieDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("movieID");
        if (id != null) {
            MovieDAO movieDAO = new MovieDAO();
            MovieDTO movie = movieDAO.getMovieByID(Integer.parseInt(id));
            if (movie != null) {
                request.setAttribute("movie", movie);
                request.getRequestDispatcher("DetailMovie.jsp").forward(request, response);
            } else {
                response.sendRedirect("Movie.jsp?error=notfound");
            }
        } else {
            response.sendRedirect("Movie.jsp?error=invalidid");
        }
    }
}