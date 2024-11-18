/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.events.EventDAO;
import project.events.EventDTO;

/**
 *
 * @author HAO
 */
@WebServlet(name = "EventController", urlPatterns = {"/eventlist"})
public class EventController extends HttpServlet{
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
           

            EventDAO dao = new EventDAO();

            if (action == null || action.equals("") || action.equals("event")) {
                List<EventDTO> list = dao.list();

                request.setAttribute("eventlist", list);
                request.getRequestDispatcher("/eventlist.jsp").forward(request, response);
            }
           

        } catch (Exception ex) {
            Logger.getLogger(EventController.class.getName()).log(Level.SEVERE, "Error processing request", ex);
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
        return "MovieController handles movie actions like listing movies and forwarding to movielist.jsp";
    }
}
