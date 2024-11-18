<%-- 
    Document   : footer.jsp
    Created on : Jun 25, 2024, 2:20:19 PM
    Author     : luula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="line">
    <p></p>
</div>

<!----------------------------------------------- FINISH EVENTS ----------------------------------------------------------------------->

<!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
<div id="footer">

    <div class="col-md-3" id="footer_col">
        <h5 style="font-size: 20px; font-weight: 600;">HALM Việt Nam</h5>
        <form id="movieForm" action="movielist" method="POST" style="display:none;">
            <input type="hidden" name="action" value="movie" />
        </form>
        <a href="#" onclick="document.getElementById('movieForm').submit(); return false;" style="color: azure; text-decoration: none">
            Phim đang chiếu
        </a>
        <p></p>
        
        <form id="provinceForm" action="provincelist" method="POST" style="display:none;">
            <input type="hidden" name="action" value="province" />
        </form>

        <a href="#" onclick="document.getElementById('provinceForm').submit(); return false;" style="color: azure; text-decoration: none">
            Rạp phim
        </a>
        <p></p>

        <p><a  href="dactrung4DX.jsp" style="color: azure; text-decoration: none">Đặc trưng HALM</a></p>

        <form id="eventForm" action="eventlist" method="POST" style="display:none;" >
            <input type="hidden" name="action" value="event" />
        </form>

        <a href="#" onclick="document.getElementById('eventForm').submit(); return false;" style="color: azure; text-decoration: none">
            Tin tức & Ưu đãi
        </a>
    </div>



    <div class="col-md-3" id="footer_col">
        <h5 style="font-size: 20px; font-weight: 600;">Điều Khoản sử dụng</h5>
        <p><a  href="dieukhoanchung.jsp" style="color: azure; text-decoration: none">Điều Khoản Chung</a></p>
        <p><a  href="dieukhoangiaodich.jsp"style="color: azure; text-decoration: none">Điều Khoản Giao Dịch</a></p>
        <p><a  href="chinhsachthanhtoan.jsp" style="color: azure; text-decoration: none">Chính Sách Thanh Toán</a></p>
        <p><a  href="chinhsachbaomat.jsp"style="color: azure; text-decoration: none">Chính Sách Bảo Mật</a></p>
    </div>

    <div class="col-md-3" id="footer_col">
        <h5 style="font-size: 20px; font-weight: 600;">HALM Việt Nam</h5>
        <img src="images/Black Grey Minimalist Modern Cinema Logo/7.png" style="width:33%; ">
    </div>

    <div class="col-md-3" id="footer_col">
        <h5 style="font-size: 20px; font-weight: 600;">Chăm sóc khách hàng</h5>
        <p style="margin-left: -40px;">Hotline: 1900 6017</p>
        <p style="margin-left: 92px; text-align: left;">Giờ làm việc: 8:00 - 22:00 (Tất cả các ngày bao gồm cả Lễ Tết)</p>
        <p style="margin-left: 20px;">Email hỗ trợ: hoidap@cgv.vn</p>
    </div>




</div>

<!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

