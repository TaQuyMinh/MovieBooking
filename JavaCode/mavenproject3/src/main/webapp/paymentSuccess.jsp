<%-- 
    Document   : paymentSuccess
    Created on : Jul 10, 2024, 5:32:54 PM
    Author     : HAO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Thanh toán thành công</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <script src='main.js'></script>
        <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/styleindex.css">
        <link rel="stylesheet" href="css/paymentSuccess.css">

        <title>Background Animation</title>
        <style>
            body {
                margin: 0;
                height: 100vh;
                background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHKsihcHoQNGI7hfyvCmGA1Eczvm_KduBAnQ&s') no-repeat center center fixed;
                background-size: cover;
            }
            #content {
                margin-top: 100px;
                margin-bottom: 100px;
                text-align: center;
            }


        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="content">
            <h3>Bạn đã thanh toán thành công.</h3>

            <!----------------------------------------------- Bảng checkout ----------------------------------------------------------------------->
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>Tên phim</th>
                        <th>Rạp</th>
                        <th>Rạp số</th>
                        <th>Loại rạp</th>
                        <th>Suất chiếu</th>
                        <th>Ghế</th>
                        <th>Ngày chiếu</th>
                        <th>Thành tiền</th>
                        <th>Ngày thanh toán</th>
                        <th>Phương thức thanh toán</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>${requestScope.moviename}</th>
                        <th>${requestScope.cinemaname}</th>
                        <th>${requestScope.theatreID}</th>
                        <th>${requestScope.selectedFormat}</th>
                        <th>${requestScope.showtime}</th>
                        <th><c:forEach var="seat" items="${requestScope.selectedSeats}">
                                ${seat}
                            </c:forEach>
                        </th>
                        <th>${requestScope.day}</th>
                        <th>${requestScope.totalAmount}</th>
                        <th>${requestScope.purchaseDate}</th>
                        <th>${requestScope.paymentMethod} </th>
                    </tr>
                </tbody>
            </table>

            <!----------------------------------------------- Form chuyển trang ----------------------------------------------------------------------->
            <form id="selectionForm" action="home" method="POST" style="display:none;">
                <input type="hidden" name="action" value="selection" />
            </form>
            <a href="#" onclick="document.getElementById('selectionForm').submit(); return false;">Quay lại trang chủ</a>
        </div>
        <!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
        <jsp:include page="footer.jsp"/>

        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->


    </body>
</html>
