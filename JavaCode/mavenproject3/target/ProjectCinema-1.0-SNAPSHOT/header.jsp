<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="page-header-container">
    <div class="header"> 
        <!----------------------------------------------- Kiểm tra session----------------------------------------------------------------------->
        <%
            session = request.getSession();
            String username = (String) session.getAttribute("username");
            String ten = (String) session.getAttribute("name");
        %>
        <div class="col-md-6">
            <form id="detailsForm" action="UserInforController" method="POST" style="display:none;">
                <input type="hidden" name="action" value="details" />
                <input type="hidden" name="username" value="<%= username%>" />
            </form>

            <!----------------------------------------------- Vé của tôi----------------------------------------------------------------------->
            <a id="ve-cua-toi" href="#" onclick="document.getElementById('detailsForm').submit(); return false;">
                <img src="images/Black Grey Minimalist Modern Cinema Logo/ve_cua_toi.png" alt="Vé của tôi">
            </a>
        </div>

        <!----------------------------------------------- HALM----------------------------------------------------------------------->
        <div class="col-md-6" id="name">
            <form id="selectionForm" action="home" method="POST" style="display:none;">
                <input type="hidden" name="action" value="selection" />
            </form>
            <a href="#" onclick="document.getElementById('selectionForm').submit(); return false;">HALM</a>
        </div>


        <div class="col-md-6">
            <!----------------------------------------------- Đặt vé ngay----------------------------------------------------------------------->
            <form id="dat-ve" action="movielist" method="POST" style="display:none;">
                <input type="hidden" name="action" value="movie" />
            </form>
            <a href="#" onclick="document.getElementById('dat-ve').submit(); return false;">
                <img src="images/Black Grey Minimalist Modern Cinema Logo/dat-ve.png" alt="Đặt vé ngay" style="width: 30%; height: 40px;"/>
            </a>

            <!-----------------------------------------------Xin chào + Tên người dùng----------------------------------------------------------------------->
            <%

                if (ten != null) {
            %>
            <form id="userForm" action="UserInforController" method="POST" style="display:none;">
                <input type="hidden" name="action" value="details" />
                <input type="hidden" name="username" value="<%= username%>" />
            </form>            
            <a href="#" onclick="document.getElementById('userForm').submit(); return false;">Xin chào <%=ten%> |</a>

            <form id="logoutForm" action="login" method="POST" style="display:none;">
                <input type="hidden" name="action" value="logout" />
            </form>
            <a href="#" onclick="document.getElementById('logoutForm').submit(); return false;">Logout</a>

            <!----------------------------------------------- Đăng nhập/ Đăng ký----------------------------------------------------------------------->
            <%
            } else {
            %>
            <a href="login.jsp">Đăng nhập/ Đăng ký</a>
            <%
                }
            %>

        </div>

    </div> <!-- Finish content header-->
    <div id="line">
        <p></p>
    </div>
</div>

<!----------------------------------------------- NAVIGATION----------------------------------------------------------------------->

<div class="navigation">
    <ul>
        <!----------------------------------------------- phim đang chiếu----------------------------------------------------------------------->
        <li id="phim-dang-chieu">
            <form id="movieForm" action="movielist" method="POST" style="display:none;">
                <input type="hidden" name="action" value="movie" />
            </form>

            <a href="#" onclick="document.getElementById('movieForm').submit(); return false;">
                <img src="images/Black Grey Minimalist Modern Cinema Logo/3.png" alt="Phim đang chiếu" style="margin-left: -20px" />
            </a>

        </li>

        <!----------------------------------------------- rạp chiếu----------------------------------------------------------------------->
        <li id="rap-chieu">
            <form id="provinceForm" action="provincelist" method="POST" style="display:none;">
                <input type="hidden" name="action" value="province" />
            </form>

            <a href="#" onclick="document.getElementById('provinceForm').submit(); return false;">
                <img src="images/Black Grey Minimalist Modern Cinema Logo/1.png" alt="Rạp phim" />
            </a>

        </li>

        <!----------------------------------------------- đặc trưng----------------------------------------------------------------------->
        <li id="dac-trung">
            <a href="dactrung4DX.jsp">
                <img
                    src="images/Black Grey Minimalist Modern Cinema Logo/2.png"
                    alt="Đặc trưng HALM"
                    />
            </a>
        </li>

        <!----------------------------------------------- tin tức----------------------------------------------------------------------->
        <li id="tin-tuc">
            <form id="eventForm" action="eventlist" method="POST" style="display:none;">
                <input type="hidden" name="action" value="event" />
            </form>

            <a href="#" onclick="document.getElementById('eventForm').submit(); return false;">
                <img src="images/Black Grey Minimalist Modern Cinema Logo/4.png" alt="Tin tức và Ưu đãi" />
            </a>

        </li>

        <!----------------------------------------------- đăng ký ngay----------------------------------------------------------------------->
        <li id="dang-ky-ngay">
            <%
                if (ten != null) {
            %>
            <form id="logoutForm" action="login" method="POST" style="display:none;">
                <input type="hidden" name="action" value="logout" />
            </form>

            <a href="#" onclick="document.getElementById('logoutForm').submit(); return false;">
                <img src="images/Black Grey Minimalist Modern Cinema Logo/5.png" alt="Đăng ký ngay" />
            </a>

            <%
            } else {
            %>
            <a href="login.jsp">
                <img
                    src="images/Black Grey Minimalist Modern Cinema Logo/5.png"
                    alt="Đăng ký ngay"
                    />
            </a>
            <%
                }
            %>
        </li> 
    </ul>
</div>