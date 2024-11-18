/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

/**
 *
 * @author HAO
 */

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.events.EventDAO;
import project.events.EventDTO;


public class EventcontentController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String eventID = request.getParameter("eventID");

        try {
            if (action == null || action.equals("") || action.equals("eventcontent")) {
                if (eventID != null) {
                    EventDAO dao = new EventDAO();
                    EventDTO event = dao.getEventByID(Integer.parseInt(eventID));
                    request.setAttribute("event", event);
                    request.getRequestDispatcher("eventcontent.jsp").forward(request, response);
                } else {
                    response.sendRedirect("eventlist.jsp");
                }
            }

        } catch (Exception ex) {
            Logger.getLogger(EventcontentController.class.getName()).log(Level.SEVERE, "Error processing request", ex);
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
        return "EventcontentController handles event content actions and forwards to eventcontent.jsp";
    }
}

