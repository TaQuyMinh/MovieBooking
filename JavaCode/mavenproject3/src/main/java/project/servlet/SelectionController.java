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
@WebServlet(name = "SelectionController", urlPatterns = {"/selection"}, loadOnStartup = 1)

public class SelectionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String movieID = request.getParameter("movieID");
        String userName = request.getParameter("username");
        String name = request.getParameter("name");
        try {


            if (action == null || action.equals("") || action.equals("selection")) {
                MovieDAO dao = new MovieDAO();
                EventDAO daoo = new EventDAO();
                List<MovieDTO> list = dao.list();
                request.setAttribute("movieselection", list);
                  List<EventDTO> list2 = daoo.list();
                request.setAttribute("eventselection", list2);
                request.getRequestDispatcher("/home.jsp").forward(request, response);
            }else if(action.equals("details")){
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO();
                user = dao.detail(userName);
                request.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("userInfor.jsp");
                rd.forward(request, response);
            }else if(action.equals("edit")){
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO();
                user = dao.detail(userName);
                
                request.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("userInforEdit.jsp");
                rd.forward(request, response);
            }else if(action.equals("update")){
                
                
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
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

                dao.update(user);
                
                request.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("userInfor.jsp");
                rd.forward(request, response);
     
            }else if(action.equals("cancel")){
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO();
                user = dao.detail(userName);
                request.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("userInfor.jsp");
                rd.forward(request, response);

            }

        } catch (Exception ex) {
            Logger.getLogger(SelectionController.class.getName()).log(Level.SEVERE, "Error processing request", ex);
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
