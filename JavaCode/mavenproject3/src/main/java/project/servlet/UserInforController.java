/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
import javax.transaction.Transaction;
import project.Users.UserDAO;
import project.Users.UserDTO;
import project.transaction.TransactionDAO;
import project.transaction.TransactionDTO;

/**
 *
 * @author HAO
 */
@WebServlet(name = "UserInforController", urlPatterns = {"/UserInforController"})
public class UserInforController extends HttpServlet {

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
        String userName = request.getParameter("username");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        String userSession = (String) session.getAttribute("username");
        try {
            if (action.equals("details")) {
                UserDAO dao = new UserDAO();
                UserDTO user = dao.detail(userName);

                if (user == null || userSession == null) {
                    request.setAttribute("error", "Vui lòng đăng nhập để tiếp tục");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                } else {
                    int userID = user.getUserID();
                    TransactionDAO transactionDao = new TransactionDAO();
                    List<TransactionDTO> transactionlist = transactionDao.transaction(userID);
                    request.setAttribute("transactionlist", transactionlist);
                    request.setAttribute("user", user);
                    RequestDispatcher rd = request.getRequestDispatcher("userInfor.jsp");
                    rd.forward(request, response);
                }
            } else if (action.equals("edit")) {
                UserDAO dao = new UserDAO();
                UserDTO user = dao.detail(userName);
                if (user == null || userSession == null) {
                    request.setAttribute("error", "Vui lòng đăng nhập để tiếp tục");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                } else {

                    request.setAttribute("user", user);
                    RequestDispatcher rd = request.getRequestDispatcher("userInforEdit.jsp");
                    rd.forward(request, response);
                }

            } else if (action.equals("update")) {
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String newPassword = request.getParameter("newPassword");

                Date birthday = Date.valueOf(request.getParameter("birthday"));
                request.getSession().setAttribute("name", name);

                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO();
                user = dao.detail(userName);

                user.setUsername(userName);
                user.setName(name);
                user.setEmail(email);
                user.setPhoneNumber(phoneNumber);
                user.setGender(gender);
                user.setAddress(address);
                user.setBirthday(birthday);
                user.setPassword(newPassword);

                dao.update(user);

                request.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("userInfor.jsp");
                rd.forward(request, response);

            } else if (action.equals("cancel")) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO();
                user = dao.detail(userName);
                request.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("userInfor.jsp");
                rd.forward(request, response);

            }

        } catch (Exception ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, "Error processing request", ex);
            throw new ServletException("Error processing request" + action, ex);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
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
