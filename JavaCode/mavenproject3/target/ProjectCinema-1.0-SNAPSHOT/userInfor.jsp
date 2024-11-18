<%-- 
    Document   : userInfor
    Created on : Jun 25, 2024, 4:14:02 PM
    Author     : luula
--%>

<%@page import="project.Users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin khách hàng</title>
        <link
            rel="shortcut icon"
            type="image/png"
            href="images/Black Grey Minimalist Modern Cinema Logo/7.png"
            />

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/Infor.css" />
        <link rel="stylesheet" href="css/styleindex.css" />

        <style>
            body {
                margin: 0;
                height: 100vh;
                background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHKsihcHoQNGI7hfyvCmGA1Eczvm_KduBAnQ&s")
                    no-repeat center center fixed;
                background-size: cover;
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <!----------------------------------------------- FINISH NAVIGATION----------------------------------------------------------------------->

        <!----------------------User------------------------------------->
        <div class="user container">
            <div class="col-md-3 user-header">
                <p>TÀI KHOẢN HALM</p>
                <div class="user-function">
                    <a href="#" id="general_info_link" onclick="showGenerateInfor()"
                       >THÔNG TIN CHUNG</a
                    >
                    <a href="#" id="detail_info_link" onclick="showDetailInfor()"
                       >CHI TIẾT THÔNG TIN</a
                    >
                    <a
                        href="#"
                        id="transaction-infor_link"
                        onclick="showTransactionInfor()"
                        >LỊCH SỬ GIAO DỊCH</a
                    >
                </div>
            </div>

            <div class="col-md-9">
                <header class="user-header-infor"><p>THÔNG TIN CHUNG</p></header>
                <div class="col-md-2">
                    <div class="avatar">
                        <img src="images/avatar.jpg" alt="Avatar" />
                        <div class="hidden">

                        </div>
                    </div>
                    <div class="button-change">
                        <form action="UserInforController" method="POST">
                            <input name="username" value=${requestScope.user.username} type="hidden">
                            <input name="action" value="edit" type="hidden">
                            <input class="edit" type="submit" value="Thay đổi">                  
                        </form>

                    </div>
                </div>
                <!---------------Thông tin chung---x---------------->

                <div class="col-md-10">
                    <div class="main-infor" id="main_infor">
                        <% UserDTO user = (UserDTO) request.getAttribute("user");%>
                        <ul>
                            <li>Tên: ${requestScope.user.name}<span id="user-name"></span></li>
                            <li>Email: <%= user.getEmail()%><span id="email"></span></li>
                            <li>Số điện thoại: <%= user.getPhoneNumber()%> <span id="phone"></span></li>
                        </ul>
                    </div>
                </div>
                <!---------------Finished Thông tin chung------------------->

                <!---------------Chi tiết thông tin------------------->
                <div class="detail-infor hidden" id="detail_infor">
                    <ul>
                        <li>Tên: <%= user.getName()%></li>
                        <li>Email: <%= user.getEmail()%></li>
                        <li>Số điện thoại: <%= user.getPhoneNumber()%></li>
                        <li>Giới tính: <%= user.getGender().equals("male") ? "Nam" : "Nữ"%></li>
                        <li>Thành phố/ Tỉnh: <%= user.getAddress()%></li>
                        <li>Ngày sinh: <%= user.getBirthday()%></li>
                    </ul>
                </div>

                <div class="transaction-infor hidden" id="transaction_infor">
                    <table>
                        <tr>
                            <th>Tên phim</th>
                            <th>Mã vé</th>
                            <th>Ghế</th>
                            <th>Ngày mua</th>
                            <th>Ngày chiếu</th>
                            <th>Suất chiếu</th>
                            <th>Thành tiền</th>
                            <th>Phương thức thanh toán</th>
                        </tr>

                        <c:forEach var="transaction" items="${transactionlist}">
                            <tr>
                                <td>${transaction.title}</td>
                                <td>${transaction.ticketID}</td>
                                <td>${transaction.seatName}</td>
                                <td>${transaction.purchaseDate}</td>
                                <td>${transaction.showtimeDate}</td>
                                <td>${transaction.startTime}</td>
                                <td>${transaction.amount}đ</td>
                                <td>${transaction.paymentMethod}</td>
                            </tr>

                        </c:forEach>



                    </table>
                </div>
            </div>
        </div>

        <!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
        <jsp:include page="footer.jsp"/>

        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

        <script src="Script/userInfor.js"></script>
    </body>
</html>
