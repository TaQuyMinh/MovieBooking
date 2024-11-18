package project.servlet;

import project.cinemas.CinemaDAO;
import project.cinemas.CinemaDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddCinemaController", urlPatterns = {"/AddCinemaController"})
public class AddCinemaController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    boolean status = false;
    try {
        int cinemaID = Integer.parseInt(request.getParameter("cinemaID"));
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        int numberOfTheatres = Integer.parseInt(request.getParameter("numberOfTheatres"));
        int provinceID = Integer.parseInt(request.getParameter("provinceID"));

        CinemaDTO cinema = new CinemaDTO(cinemaID, name, location, numberOfTheatres, provinceID);
        CinemaDAO dao = new CinemaDAO();
        dao.addCinema(cinema);
        status = true;
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        request.getSession().setAttribute("statusCreateFilm", status);
        request.getRequestDispatcher("CinemaListController").forward(request, response);
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
