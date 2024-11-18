/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.movies.MovieDAO;
import project.movies.MovieDTO;

public class UpdateMovieController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if ("UpdateMovie".equals(action)) {
            int movieID = Integer.parseInt(request.getParameter("id"));
            MovieDAO dao = new MovieDAO();
            MovieDTO movie = dao.getMovieByID(movieID);
            request.setAttribute("movie", movie);
            request.getRequestDispatcher("UpdateMovie.jsp").forward(request, response);
            
        } else if ("SaveMovieUpdate".equals(action)) {
            int movieID = Integer.parseInt(request.getParameter("movieID"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            Date releaseDate = Date.valueOf(request.getParameter("releaseDate"));
            int duration = Integer.parseInt(request.getParameter("duration"));
            float rating = Float.parseFloat(request.getParameter("rating"));
            String director = request.getParameter("director");
            String cast = request.getParameter("cast");
            String genre = request.getParameter("genre");
            String language = request.getParameter("language");
            String poster = request.getParameter("poster");
            String trailer = request.getParameter("trailer");
            int viewOfMovie = Integer.parseInt(request.getParameter("viewOfMovie"));
            String bannerImage = request.getParameter("bannerImage");
            String bannerStatus = request.getParameter("bannerStatus");
            MovieDTO movie = new MovieDTO(movieID, title, description, releaseDate, duration, rating, director, cast, genre, language, poster, trailer, viewOfMovie, bannerImage, bannerStatus);
            MovieDAO dao = new MovieDAO();
            dao.updateMovie(movie);
            request.getRequestDispatcher("MovieListController").forward(request, response);
        }
    }
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateMovieController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateMovieController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}