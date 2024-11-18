/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.Users.UserDAO;
import project.Users.UserDTO;
import project.days.DayDAO;
import project.days.DayDTO;
import project.formats.FormatDAO;
import project.formats.FormatDTO;
import project.movies.MovieDAO;
import project.payment.PaymentDAO;
import project.seats.SeatDAO;
import project.seats.SeatDTO;
import project.showtimes.ShowtimeDAO;
import project.showtimes.ShowtimeDTO;
import project.ticket.TicketDAO;
import project.ticket.TicketDTO;

/**
 *
 * @author HAO
 */
@WebServlet(name = "PaymentSuccessController", urlPatterns = {"/PaymentSuccessController"})
public class PaymentSuccessController extends HttpServlet {

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

        String moviename = request.getParameter("moviename");
        String movieIDStr = request.getParameter("movieID");
        String cinemaname = request.getParameter("cinemaname");
        String selectedFormat = request.getParameter("selectedFormat");
        String showtimeStr = request.getParameter("showtime");
        String dayStr = request.getParameter("day");
        String theatreIDStr = request.getParameter("theatreID");
        String selectedSeatsJson = request.getParameter("selectedSeats");
        String totalAmountStr = request.getParameter("totalAmountStr");
        String paymentMethod = request.getParameter("paymentMethod");
        LocalDate purchaseDay = LocalDate.now();

        HttpSession session = request.getSession();
        String userSession = (String) session.getAttribute("username");

        //-------------xử lý giá trị ghế ngồi----------------------
        Gson gson = new Gson();
        List<String> selectedSeats = gson.fromJson(selectedSeatsJson, new TypeToken<List<String>>() {
        }.getType());
        String seatsString = String.join(", ", selectedSeats);
        try {

            double totalAmount = 0;
            int movieID = 0;
            int theatreID = 0;
            int dayID = 0;
            int formatID = 0;
            int showtimeID = 0;
            int userID = 0;
            Time showtime = Time.valueOf(showtimeStr);
            Date day = Date.valueOf(dayStr);
            Date purchaseDate = Date.valueOf(purchaseDay);
            try {
                theatreID = Integer.parseInt(theatreIDStr);
                totalAmount = Double.parseDouble(totalAmountStr);
                NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
                String formattedTotalAmount = formatter.format(totalAmount);
                request.setAttribute("totalAmount", formattedTotalAmount + "đ");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            try {
                movieID = Integer.parseInt(movieIDStr);
                request.setAttribute("movieID", movieID);
            } catch (Exception e) {
            }

            //-------------lấy userID----------------------
            UserDAO userDao = new UserDAO();
            UserDTO user = userDao.detail(userSession);
            userID = user.getUserID();

            //-------------lấy dayID----------------------
            DayDAO dayDao = new DayDAO();
            List<DayDTO> daylist = dayDao.list();
            for (DayDTO daytest : daylist) {
                if (daytest.getDate().compareTo(day) == 0) {
                    dayID = daytest.getDayID();
                    break;
                }
            }

            //-------------lấy formatID----------------------
            FormatDAO formatDao = new FormatDAO();
            List<FormatDTO> formatlist = formatDao.list();
            for (FormatDTO formattest : formatlist) {
                if (formattest.getFormatName().equals(selectedFormat)) {
                    formatID = formattest.getFormatID();
                    break;
                }
            }

            //-------------lấy showtimeID----------------------
            try {
                ShowtimeDAO showtimeDao = new ShowtimeDAO();
                List<ShowtimeDTO> showtimelist = showtimeDao.list();
                for (ShowtimeDTO showtimetest : showtimelist) {
                    if (showtimetest.getStartTime().equals(showtime) && showtimetest.getMovieID() == movieID && showtimetest.getTheatreID() == theatreID && showtimetest.getDayID() == dayID && showtimetest.getFormatID() == formatID) {
                        showtimeID = showtimetest.getShowtimeID();
                        break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            //-------------thêm dữ liệu vé đã đặt vào Database----------------------
            TicketDAO ticketDao = new TicketDAO();
            ticketDao.addTicket(seatsString, purchaseDate, totalAmount, userID, showtimeID);

            //-------------------------xử lý các ghế đã được chọn-----------------------------------------------
            SeatDAO seatDao = new SeatDAO();
            List<SeatDTO> seatlistByShowtimeID = seatDao.listByShowtimeID(showtimeID);

            int ticketID = 0;
            List<TicketDTO> ticketlist = ticketDao.list();
            int seatID = 0;
            for (TicketDTO tickettest : ticketlist) {
                if (showtimeID == tickettest.getShowtimeID() && tickettest.getIsCounted() != 1) {
                    ticketID = tickettest.getTicketID();
                    String seats = tickettest.getSeatName();
                    String[] seatArray = seats.split(", ");
                    for (String seat : seatArray) {
                        for (SeatDTO seattest : seatlistByShowtimeID) {
                            String seatCode = seattest.getRow() + seattest.getColumn();
                            if (seat.equals(seatCode)) {
                                seatID = seattest.getSeatID();
                                seatDao.updateSeatStatus(seatID, "Booked", showtimeID);
                                break;
                            }
                        }
                    }
                }
            }
        //-------------------------xử lý thông tin vé, và tăng lượt xem cho phim-----------------------------------------------
            MovieDAO movieDao = new MovieDAO();
            movieDao.updateView(movieID);
            ticketDao.countViewByTicket();

            //-------------------------xử lý lịch sử giao dịch-----------------------------------------------
            PaymentDAO paymentDao = new PaymentDAO();
            paymentDao.addPayment(totalAmount, paymentMethod, ticketID, userID);
            
            
            request.setAttribute("moviename", moviename);
            request.setAttribute("cinemaname", cinemaname);
            request.setAttribute("selectedFormat", selectedFormat);
            request.setAttribute("showtime", showtimeStr);
            request.setAttribute("day", dayStr);
            request.setAttribute("theatreID", theatreIDStr);
            request.setAttribute("selectedSeats", selectedSeats);
            request.setAttribute("paymentMethod", paymentMethod);
            request.setAttribute("purchaseDate", purchaseDate);
            request.setAttribute("showtimeID", showtimeID);

            RequestDispatcher rd = request.getRequestDispatcher("paymentSuccess.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
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
