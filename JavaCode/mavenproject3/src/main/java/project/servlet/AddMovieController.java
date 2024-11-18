/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.movies.MovieDAO;
import project.movies.MovieDTO;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author PC
 */
public class AddMovieController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean status = false;
        try {
            int movieID = Integer.parseInt(request.getParameter("movieID"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String releaseDateStr = request.getParameter("releaseDate");
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
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date releaseDate = sdf.parse(releaseDateStr);

            MovieDTO movie = new MovieDTO(movieID, title, description, releaseDate, duration, rating, director, cast, genre, language, poster, trailer, viewOfMovie, bannerImage, bannerStatus);
            MovieDAO dao = new MovieDAO();
            dao.addMovie(movie);
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getSession().setAttribute("statusCreateFilm", status);
            request.getRequestDispatcher("MovieListController").forward(request, response);
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
