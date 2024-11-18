/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import project.Users.UserDAO;
import project.Users.UserDTO;
import project.events.EventDAO;
import project.events.EventDTO;
import project.movies.MovieDAO;
import project.movies.MovieDTO;

/**
 *
 * @author HAO
 */
//@WebServlet(name = "HomeController", urlPatterns = {"/home"}, loadOnStartup = 1)
public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        
        HttpSession session = request.getSession();
        String userSession = (String) session.getAttribute("username");
        Boolean cookieRead = (Boolean) session.getAttribute("cookieRead");
        Cookie[] cookies = request.getCookies();
        
        try {

            if (action == null || action.equals("") || action.equals("selection")) {
                MovieDAO dao = new MovieDAO();
                EventDAO daoo = new EventDAO();
                List<MovieDTO> movielist = dao.list();
                request.setAttribute("movieselection", movielist);
                List<EventDTO> eventlist = daoo.list();
                request.setAttribute("eventselection", eventlist);
                
                if(cookieRead == null && cookies != null){
                for (Cookie cookie : cookies) {
                    if ("username".equals(cookie.getName()) || "password".equals(cookie.getName())){
                        session.setAttribute("cookieRead", true);
                        request.getRequestDispatcher("/login").forward(request, response);
                    }
                }
                }
                
                request.getRequestDispatcher("/home.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, "Error processing request", ex);
            throw new ServletException("Error processing request" + action, ex);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "MovieController handles movie actions like listing movies and forwarding to movielist.jsp";
    }
}
