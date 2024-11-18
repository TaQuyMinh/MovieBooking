package project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.Users.UserDAO;
import project.Users.UserDTO;

public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            // Check for "remember me" cookies
            Cookie[] cookies = request.getCookies();
            String savedUsername = null;
            String savedPassword = null;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("username".equals(cookie.getName())) {
                        savedUsername = cookie.getValue();
                    }
                    if ("password".equals(cookie.getName())) {
                        savedPassword = cookie.getValue();
                    }
                }

                if (savedUsername != null && savedPassword != null) {
                    UserDAO dao = new UserDAO();
                    try {
                        UserDTO user = dao.login(savedUsername, savedPassword);

                            if (user != null) {
                            HttpSession session = request.getSession(true);
                            session.setAttribute("name", user.getName());
                            session.setAttribute("username", user.getUsername());
                            request.getRequestDispatcher("/home.jsp").forward(request, response);
                        }
         
                    } catch (Exception e) {
                        log("Error retrieving user by username: " + e.getMessage());
                        request.setAttribute("error", "An error occurred while trying to log in. Please try again.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            }
        }

        String username = request.getParameter("user");
        String password = request.getParameter("password");

        if (action == null || action.equals("login")) {
            UserDAO dao = new UserDAO();
            UserDTO user = dao.login(username, password);
            if (user != null) {
                if(user.getUsername().equals("admin")){
                   request.getRequestDispatcher("DashboardController").forward(request, response);
                }
                HttpSession session = request.getSession(true);
                session.setAttribute("name", user.getName());
                session.setAttribute("username", user.getUsername());
                

                

                // Handle "Remember Me" functionality
                String remember = request.getParameter("remember");
                if ("true".equals(remember)) {
                    Cookie userCookie = new Cookie("username", username);
                    Cookie passCookie = new Cookie("password", password);
                    userCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days
                    passCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days
                    response.addCookie(userCookie);
                    response.addCookie(passCookie);
                } else {
                    Cookie userCookie = new Cookie("username", "");
                    Cookie passCookie = new Cookie("password", "");
                    userCookie.setMaxAge(0);
                    passCookie.setMaxAge(0);
                    response.addCookie(userCookie);
                    response.addCookie(passCookie);
                }

                response.sendRedirect("home");
            } else {
                request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không chính xác");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else if (action != null && action.equals("logout")) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            Cookie userCookie = new Cookie("username", "");
            Cookie passCookie = new Cookie("password", "");
            userCookie.setMaxAge(0);
            passCookie.setMaxAge(0);
            response.addCookie(userCookie);
            response.addCookie(passCookie);
            request.setAttribute("error", "Đăng xuất thành công");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (action != null && action.equals("register")) {
            Integer id = 0;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException ex) {
                log("Parameter is has wrong format.");
            }

            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("email");
            String Username = request.getParameter("username");
            String Password = request.getParameter("Password");
            String address = request.getParameter("address");
            String day = request.getParameter("dob-day");
            String month = request.getParameter("dob-month");
            String year = request.getParameter("dob-year");
            String birthday = year + "-" + month + "-" + day;
            String gender = request.getParameter("gender");

            UserDTO user = new UserDTO();

            user.setUserID(id);
            user.setName(name);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setAddress(address);
            user.setGender(gender);
            user.setUsername(Username);
            user.setPassword(Password);

            //dao.insert(user);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        response.setContentType("text/html; charset=UTF-8");
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
