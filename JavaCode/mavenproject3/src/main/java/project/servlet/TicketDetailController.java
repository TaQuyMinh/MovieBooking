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
import project.ticket.TicketDAO;
import project.ticket.TicketDTO;


@WebServlet(name = "CinemaDetailController", urlPatterns = {"/CinemaDetailController"})
public class TicketDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            TicketDAO cinemaDAO = new TicketDAO();
            TicketDTO ticket = cinemaDAO.getTicketById(Integer.parseInt(id));
            if (ticket != null) {
                request.setAttribute("ticket", ticket);
                request.getRequestDispatcher("DetailBooking.jsp").forward(request, response);
            } else {
                response.sendRedirect("Booking.jsp?error=notfound");
            }
        } else {
            response.sendRedirect("Cinema.jsp?error=invalidid");
        }
    }
}
