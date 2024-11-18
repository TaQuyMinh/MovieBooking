/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.Users.UserDAO;
import project.Users.UserDTO;
import project.cinemas.CinemaDAO;
import project.cinemas.CinemaDTO;
import project.days.DayDAO;
import project.days.DayDTO;
import project.formats.FormatDAO;
import project.formats.FormatDTO;
import project.movies.MovieDAO;
import project.movies.MovieDTO;
import project.provinces.ProvinceDAO;
import project.provinces.ProvinceDTO;
import project.showtimes.ShowtimeDAO;
import project.showtimes.ShowtimeDTO;

/**
 *
 * @author HAO
 */
@WebServlet(name = "BookingController", urlPatterns = {"/BookingController"})
public class BookingController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String movieIDStr = request.getParameter("movieID");

        HttpSession session = request.getSession();
        String userSession = (String) session.getAttribute("username");

        if (userSession == null) {
            request.setAttribute("error", "Vui lòng đăng nhập để tiếp tục");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
            return;
        }
        
        if (action.equals("timebooking")) {
            if (movieIDStr != null) {
                try {
         
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    request.setAttribute("dateFormat", dateFormat);
                    int movieID = Integer.parseInt(movieIDStr);
                    MovieDAO movieDao = new MovieDAO();
                    MovieDTO movie = movieDao.getMovieByID(movieID);
                    request.setAttribute("movie", movie);

                    ProvinceDAO provinceDao = new ProvinceDAO();
                    List<ProvinceDTO> provincelist = (List<ProvinceDTO>) provinceDao.list();
                    request.setAttribute("provincelist", provincelist);

                    FormatDAO formatDao = new FormatDAO();
                    List<FormatDTO> formatlist = (List<FormatDTO>) formatDao.list();
                    request.setAttribute("formatlist", formatlist);

                    DayDAO dayDao = new DayDAO();
                    List<DayDTO> daylist = dayDao.list();
                    request.setAttribute("daylist", daylist);

                    CinemaDAO cinemaDao = new CinemaDAO();
                    List<CinemaDTO> cinemalist = cinemaDao.list();
                    request.setAttribute("cinemalist", cinemalist);

                    ShowtimeDAO showtimeDao = new ShowtimeDAO();
                    List<ShowtimeDTO> showtimelist = showtimeDao.list();
                    request.setAttribute("showtimelist", showtimelist);

                    RequestDispatcher rd = request.getRequestDispatcher("timebooking.jsp");
                    rd.forward(request, response);
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid movie ID");
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing movie ID");
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
