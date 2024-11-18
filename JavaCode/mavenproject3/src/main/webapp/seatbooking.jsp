<%-- 
    Document   : bookticket
    Created on : Jul 5, 2024, 9:38:01 PM
    Author     : HAO
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>CHỌN GHẾ</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <script src='main.js'></script>
        <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/seatbooking.css">
        <link rel="stylesheet" href="css/styleindex.css">

        <title>Background Animation</title>
        <style>
            body {
                margin: 0;
                height: 100vh;
                background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHKsihcHoQNGI7hfyvCmGA1Eczvm_KduBAnQ&s') no-repeat center center fixed;
                background-size: cover;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <!------------------------------------------------ĐẶT VÉ------------------------------------------------------------------------------------>
        <div class="title-box" style="margin-top: 30px;">
            <h3 style="margin-top: 10px;">CHỌN GHẾ</h3>
        </div>
        <div class="flex">

            <!----------------------------------------------- Bảng chọn vị trí ghế ngồi ----------------------------------------------------------------------->
            <div class="container">
                <c:forEach var="seat" items="${seatlist}">
                    <c:if test="${seat.column == 1}">
                        <div class="row">
                            <span class="span-left">${seat.row}</span>
                            <div class="seats">
                            </c:if>

                            <c:choose>
                                <c:when test="${seat.status == 'Available'}">
                                    <label><input type="checkbox" class="seatCheckbox" name="seats" value="${seat.row}${seat.column}">${seat.column}</label>
                                    </c:when>
                                    <c:otherwise>
                                    <label class="booked">${seat.column}</label>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${seat.column == 16}">
                            </div>
                            <span class="span-right">${seat.row}</span>
                        </div>
                    </c:if>
                </c:forEach>
                <div class="note">
                    <div class="sold"></div> <span class="note-noi-dung">Ghế đã được đặt</span>
                    <div class="checked"></div> <span class="note-noi-dung">Ghế đang chọn</span>
                </div>

            </div>


            <!----------------------------------------------- Bảng thông tin các thôngchọn tin đã ----------------------------------------------------------------------->
            <div class="info">
                <div class="flex-info">
                    <img class="anh" src="${requestScope.poster}">

                    <div class="name">${requestScope.moviename}</div>

                </div>

                <div class="rap">TÊN RẠP: ${requestScope.selectedCinema}</div>
                <div class="loairap">Loại rạp: ${requestScope.selectedFormat}</div>
                <div class="suat">Suất: ${requestScope.showtime} </div>
                <div class="day">Ngày: ${requestScope.selectedDay}</div>
                <div class="rapso">Rạp số: ${requestScope.theatreID}</div>


                <div class="thanh-toan">
                    <div class="flex"><div class="tong-cong">Tổng cộng: </div> <span id="totalAmountDisplay">0 đ</span></div>
                    <div class="flex"><div class="ghe">Ghế đã chọn: </div> <span id="selectedSeats"></span></div>
                </div>

            </div>

        </div>

                <!----------------------------------------------- Form chuyển trang ----------------------------------------------------------------------->
        <form id="bookingForm" action="PaymentController" method="post" >
            <input type="hidden" id="poster" name="poster" value="${requestScope.poster}">
            <input type="hidden" id="moviename" name="moviename" value="${requestScope.moviename}">
            <input type="hidden" id="selectedFormat" name="selectedFormat" value="${requestScope.selectedFormat}">
            <input type="hidden" name="movieID" id="movieID" value="${requestScope.movieID}">
            <input type="hidden" id="cinemaname" name="cinemaname" value="${requestScope.selectedCinema}">
            <input type="hidden" id="showtime" name="showtime" value="${requestScope.showtime}">
            <input type="hidden" id="day" name="day" value="${requestScope.selectedDay}">
            <input type="hidden" id="theatreID" name="theatreID" value="${requestScope.theatreID}">
            <input type="hidden" id="selectedSeatsInput" name="selectedSeats" value="">
            <input type="hidden" id="totalAmountInput" name="totalAmount" value="">
        </form>

        <div class="flex-mid">
            <a style="margin-top:10px;" href="BookingController?action=timebooking&movieID=${requestScope.movieID}" class="back">Quay lại</a>
            <a href="#" onclick="submitBookingForm(); return false;" class="continous">Tiếp tục </a>
        </div>


        <div id="notification"></div>

        <!-- The Modal -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <p>Bạn chỉ có thể chọn tối đa 8 ghế.</p>
                <span class="close">Đóng</span>
            </div>
        </div>



        <!----------------------------------------------- FINISH ĐẶT VÉ----------------------------------------------------------------------->



        <!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
        <jsp:include page="footer.jsp"/>


        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

        <script src="Script/seatbooking.js"></script>
    </body>
</html>

</body>

</html>
