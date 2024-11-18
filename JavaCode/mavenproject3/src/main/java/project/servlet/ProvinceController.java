package project.servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.cinemas.CinemaDAO;
import project.cinemas.CinemaDTO;
import project.movies.MovieDAO;
import project.movies.MovieDTO;
import project.provinces.ProvinceDAO;
import project.provinces.ProvinceDTO;

public class ProvinceController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            ProvinceDAO provinceDAO = new ProvinceDAO();
            MovieDAO movieDAO = new MovieDAO();
            List<MovieDTO> movielist = movieDAO.list();
            request.setAttribute("movielist", movielist);
            if (action == null || action.equals("") || action.equals("province")) {
                List<ProvinceDTO> provinceList = provinceDAO.list();
                request.setAttribute("provincelist", provinceList);
                
               
                
                if (!provinceList.isEmpty()) {
                    for (int i = 0; i < provinceList.size(); i++) {

                        int defaultProvinceID = provinceList.get(i).getProvinceID();

                        CinemaDAO cinemaDAO = new CinemaDAO();
                        List<CinemaDTO> cinemaList = cinemaDAO.list(defaultProvinceID);
                        request.setAttribute("cinemalist" + (i + 1), cinemaList);

                    }
                }

                request.getRequestDispatcher("theatrelist.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProvinceController.class.getName()).log(Level.SEVERE, "Error processing request", ex);
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
        return "ProvinceController handles province actions and forwards to cinemalist";
    }
}
