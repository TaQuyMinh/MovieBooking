<%-- 
    Document   : payment
    Created on : Jul 5, 2024, 9:29:15 PM
    Author     : HAO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>THANH TOÁN</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <script src='main.js'></script>
        <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/styleindex.css">
        <link rel="stylesheet" href="css/payment.css">

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
        <jsp:include page="header.jsp" />
        <!----------------------------------------------- PAYMENT---------------------------------------------->
        <div class="container">
            <div class="title-box" style="margin-top: 30px;">
                <h3 style="margin-top: 10px;">THANH TOÁN</h3>
            </div>

            <!-----------------------------------------------Bảng thông tin thanh toán----------------------------------------------------------------------->
            <div class="movie-info">
                <img src="${requestScope.poster}" alt="Poster Phim" style="width: 150px;height:150px;">
                <div class="movie-details">
                    <p><strong>Tên phim: </strong>${requestScope.moviename}</p>
                    <p><strong>Tên rạp chiếu: </strong>${requestScope.cinemaname}</p>
                    <p><strong> Loại rạp: </strong>${requestScope.selectedFormat}</p>
                    <p><strong>Suất chiếu: </strong> ${requestScope.showtime}</p>
                    <p><strong> Ngày: </strong>${requestScope.day}</p>
                    <p><strong> Rạp số: </strong>${requestScope.theatreID}</p>
                    <p><strong>Mã ghế: </strong>
                        <c:forEach var="seat" items="${requestScope.selectedSeats}">
                            ${seat}
                        </c:forEach>
                    </p>
                </div>
            </div>
            <!----------------------------------------------- Các bước thanh toán ----------------------------------------------------------------------->
            <div id="payment" class="row">
                <div id="step" class="col-md-8">
                    <div class="step">
                        <div class="step-header step1-header">
                            <p>Bước 1: GIẢM GIÁ</p>
                        </div>
                        <div class="step-body step1-body">
                            <div class="form-group">
                                <label for="voucher">HALM Voucher</label>
                                <input type="text" class="form-control" id="voucher" placeholder="Nhập mã voucher">
                            </div>
                        </div>
                    </div>

                    <div class="step">
                        <div class="step-header step2-header">
                            <p>Bước 2: HÌNH THỨC THANH TOÁN</p>
                        </div>
                        <div class="step-body step2-body">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethodRadio" id="atm" value="ATM card (Thẻ nội địa)">
                                <label class="form-check-label" for="atm">
                                    ATM card (Thẻ nội địa)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethodRadio" id="international"
                                       value="Thẻ quốc tế">
                                <label class="form-check-label" for="international">
                                    Thẻ quốc tế
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethodRadio" id="momo" value="MoMo">
                                <label class="form-check-label" for="momo">
                                    MoMo
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethodRadio" id="zalopay"
                                       value="ZaloPay">
                                <label class="form-check-label" for="zalopay">
                                    ZaloPay
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <!----------------------------------------------- Form chuyển trang ----------------------------------------------------------------------->
                <form id="bookingForm1" action="PaymentSuccessController" method="post">
                    <input type="hidden" id="moviename" name="moviename" value="${requestScope.moviename}">
                    <input type="hidden" name="movieID" id="movieID" value="${requestScope.movieID}">
                    <input type="hidden" id="cinemaname" name="cinemaname" value="${requestScope.cinemaname}">
                    <input type="hidden" name="selectedFormat" id="selectedFormat" value="${requestScope.selectedFormat}">
                    <input type="hidden" id="showtime" name="showtime" value="${requestScope.showtime}">
                    <input type="hidden" id="day" name="day" value="${requestScope.day}">
                    <input type="hidden" id="theatreID" name="theatreID" value="${requestScope.theatreID}">
                    <input type="hidden" id="selectedSeats" name="selectedSeats" value="${requestScope.selectedSeat}">
                    <input type="hidden" id="totalAmount" name="totalAmountStr" value="${requestScope.totalAmountStr}">
                    <input type="hidden" id="paymentMethod" name="paymentMethod" value="">
                </form>

                <div id="calculation" class="col-md-4">
                    <div>
                        <p>Tổng cộng</p>
                        <p>${requestScope.totalAmount}</p>
                        <p>Khuyến mãi</p>
                        <p>0,00 đ</p>
                        <p>Tổng số tiền thanh toán</p>
                        <p>${requestScope.totalAmount}</p>
                    </div>

                    <div class="flex-mid">
                        <a href="BookingController?action=timebooking&movieID=${requestScope.movieID}" class="back">Quay lại</a>
                        <a href="#" onclick="submitBookingForm1(); return false;" class="continous">Tiếp tục </a>
                    </div>
                </div>
            </div>
        </div>

        <!----------------------------------------------- FINISH PAYMENT--------------------------------------------->
        <!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
        <jsp:include page="footer.jsp" />
        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>// Lấy tham chiếu đến input voucher
                            const voucherInput = document.getElementById('voucher');

                            // Lấy giá trị từ input khi người dùng nhập dữ liệu
                            const voucherValue = voucherInput.value;

                            // Ví dụ: So sánh giá trị nhập vào với một giá trị cụ thể
                            const expectedVoucher = 'your_expected_value'; // Thay thế 'your_expected_value' bằng giá trị bạn muốn so sánh

                            if (voucherValue === expectedVoucher) {
                                // Xử lý khi giá trị nhập vào trùng khớp với giá trị mong đợi
                                console.log('Giá trị nhập vào trùng khớp với giá trị mong đợi');
                            } else {
                                // Xử lý khi giá trị nhập vào không trùng khớp với giá trị mong đợi
                                console.log('Giá trị nhập vào không trùng khớp với giá trị mong đợi');
                            }
        </script>
        <script src="Script/payment.js"></script>

    </body>

</html>
