package project.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.Users.UserDAO;
import project.Users.UserDTO;
import project.days.DayDAO;
import project.days.DayDTO;
import project.formats.FormatDAO;
import project.formats.FormatDTO;
import project.seats.SeatDAO;
import project.seats.SeatDTO;
import project.showtimes.ShowtimeDAO;
import project.showtimes.ShowtimeDTO;
import project.ticket.TicketDAO;
import project.ticket.TicketDTO;

@WebServlet(name = "SeatBookingController", urlPatterns = {"/SeatBookingController"})
public class SeatBookingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String province = request.getParameter("selectedProvince");
        String format = request.getParameter("selectedFormat");
        String moviename = request.getParameter("movieName");
        String movieIDStr = request.getParameter("movieID");
        String poster = request.getParameter("posterUrl");
        String selectedTime = request.getParameter("selectedTime");
        String selectedCinema = request.getParameter("selectedCinema");
        String selectedDay = request.getParameter("selectedDay");
        String theatreIDStr = request.getParameter("theatreID");
        String selectedFormat = request.getParameter("selectedFormat");

        try {

            double totalAmount = 0;
            int movieID = 0;
            int theatreID = 0;
            int dayID = 0;
            int formatID = 0;
            int showtimeID = 0;
            int userID = 0;
            Time showtime = Time.valueOf(selectedTime);
            Date day = Date.valueOf(selectedDay);

            try {
                theatreID = Integer.parseInt(theatreIDStr);
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

            try {
                SeatDAO seatDao = new SeatDAO();
                List<SeatDTO> seatlistByShowtimeID = seatDao.listByShowtimeID(showtimeID);
                
                request.setAttribute("theatreID", theatreID);
                request.setAttribute("seatlist", seatlistByShowtimeID);
            } catch (NumberFormatException e) {

                e.printStackTrace();
            }
            try {
                request.setAttribute("movieID", movieID);
            } catch (Exception e) {
            }

            request.setAttribute("moviename", moviename);
            request.setAttribute("poster", poster);
            request.setAttribute("showtime", selectedTime);
            request.setAttribute("selectedCinema", selectedCinema);
            request.setAttribute("selectedDay", selectedDay);
            request.setAttribute("selectedFormat", selectedFormat);

            RequestDispatcher rd = request.getRequestDispatcher("seatbooking.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions
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
