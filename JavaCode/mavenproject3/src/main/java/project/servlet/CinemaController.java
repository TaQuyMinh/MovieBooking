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
import project.provinces.ProvinceDAO;
import project.provinces.ProvinceDTO;

public class CinemaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String provinceID = request.getParameter("provinceID");

        try {
            if (action != null && action.equals("cinema") && provinceID != null) {
                CinemaDAO cinemaDAO = new CinemaDAO();
                List<CinemaDTO> cinemalist = cinemaDAO.list(Integer.parseInt(provinceID));
                request.setAttribute("cinemalist", cinemalist);

                // Lấy lại danh sách tỉnh để truyền vào JSP
                ProvinceDAO provinceDAO = new ProvinceDAO();
                List<ProvinceDTO> provinceList = provinceDAO.list();
                request.setAttribute("provincelist", provinceList);

                request.getRequestDispatcher("theatrelist.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            Logger.getLogger(CinemaController.class.getName()).log(Level.SEVERE, "Error processing request", ex);
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
        return "CinemaController handles movie content actions and forwards to theatrelist.jsp";
    }
}
