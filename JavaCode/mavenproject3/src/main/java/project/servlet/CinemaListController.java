/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.cinemas.CinemaDAO;
import project.cinemas.CinemaDTO;

/**
 *
 * @author PC
 */
@WebServlet(name = "CinemaListController", urlPatterns = {"/CinemaListController"})
public class CinemaListController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CinemaDAO dao = new CinemaDAO();
        List<CinemaDTO> cinemaList = dao.list();
        request.setAttribute("cinemaList", cinemaList);
        String deleteResult = request.getParameter("deleteResult");
        request.setAttribute("deleteResult", deleteResult);
        request.getRequestDispatcher("Cinema.jsp").forward(request, response); 
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
        return "Cinema List Controller";
    }
}