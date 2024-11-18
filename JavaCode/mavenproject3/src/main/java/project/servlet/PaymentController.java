/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author HAO
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/PaymentController"})
public class PaymentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String poster = request.getParameter("poster");
        String moviename = request.getParameter("moviename");
        String movieIDStr = request.getParameter("movieID");
        String cinemaname = request.getParameter("cinemaname");
        String showtime = request.getParameter("showtime");
        String day = request.getParameter("day");
        String theatreID = request.getParameter("theatreID");
        String selectedFormat = request.getParameter("selectedFormat");
        String selectedSeat = request.getParameter("selectedSeats");
        String selectedSeatsJson = request.getParameter("selectedSeats");
        String totalAmountStr = request.getParameter("totalAmount");

        //-------------xử lý giá trị chổ ngồi----------------------
        Gson gson = new Gson();
        List<String> selectedSeats = gson.fromJson(selectedSeatsJson, new TypeToken<List<String>>() {}.getType());

        try {
            double totalAmount = 0;
            try {
                //-------------xử lý format giá tiền----------------------
                totalAmount = Double.parseDouble(totalAmountStr);
                NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
                String formattedTotalAmount = formatter.format(totalAmount);
                request.setAttribute("totalAmount", formattedTotalAmount + "đ");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            try {
                int movieID = Integer.parseInt(movieIDStr);
                request.setAttribute("movieID", movieID);
            } catch (Exception e) {
                e.printStackTrace();
            }

            request.setAttribute("poster", poster);
            request.setAttribute("moviename", moviename);
            request.setAttribute("cinemaname", cinemaname);
            request.setAttribute("selectedFormat", selectedFormat);
            request.setAttribute("showtime", showtime);
            request.setAttribute("day", day);
            request.setAttribute("theatreID", theatreID);
             request.setAttribute("selectedSeat", selectedSeats);
            request.setAttribute("selectedSeats", selectedSeats);
            request.setAttribute("totalAmountDouble", totalAmount);
            request.setAttribute("totalAmountStr", totalAmountStr);

            RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
