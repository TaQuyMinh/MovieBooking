<%-- 
    Document   : chinhsachthanhtoan
    Created on : Jul 4, 2024, 12:45:15 PM
    Author     : HAO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>CHINH SACH THANH TOAN</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
    <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!--Embed CSS here-->
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
<!------------------------------------------------THANH BAR COLLUM------------------------------------------------------------------------------------>
<div class="bar-col-dieu-khoan">
<div class="bar-chart">
    <div class="bar dieu-khoan-chung ">
        <div class="label"> <a class="a-thanh-bar" href="dieukhoanchung.jsp">ĐIỀU KHOẢN CHUNG</a></div>
    </div>
    <div class="bar dieu-khoan-giao-dich">
        <div class="label"> <a class="a-thanh-bar" href="dieukhoangiaodich.jsp">ĐIỀU KHOẢN GIAO DỊCH</a></div>
    </div>
    <div class="bar chinh-sach-thanh-toan selected">
        <div class="label"><a class="a-thanh-bar" href="chinhsachthanhtoan.jsp">CHÍNH SÁCH THANH TOÁN</a></div>
    </div>
    <div class="bar chinh-sach-bao-mat">
        <div class="label"><a class="a-thanh-bar" href="chinhsachbaomat.jsp">CHÍNH SÁCH BẢO MẬT</a></div>
    </div>
</div>

<!-----------------------------------------------NỘI DUNG ĐIỀU KHOẢN------------------------------------------------------------------------------>

<div class="container-dieu-khoan">
    <h1 class="tieu-de">CHÍNH SÁCH THANH TOÁN</h1>

    <ol class="ol-dieu-khoan">
        <li>
          <strong>QUY ĐỊNH VỀ THANH TOÁN</strong>
          <p class="the-p-dieu-khoan">Quý Khách hàng có thể lựa chọn các hình thức thanh toán sau để thanh toán cho giao dịch đặt vé trên Ứng Dụng của HALM Việt Nam:</p>
          <p class="the-p-dieu-khoan">(i) Thẻ Thanh toán Quốc tế hoặc thẻ Thanh toán Nội địa;</p>
          <p class="the-p-dieu-khoan">(ii) Ví điện tử (Momo, Zalopay, ShopeePay, Viettelpay);</p>
          <p class="the-p-dieu-khoan">(iii) Các cổng thanh toán Payoo, VNPAY và ứng dụng QR code;</p>
          <p class="the-p-dieu-khoan">(iv) Thẻ quà Tặng HALM Cinemas (HALM Gift cards, HALM E-Gift cards), Phiếu đổi vé Xem phim HALM Cinemas (HALM vouchers, HALM E-vouchers);</p>
          <p class="the-p-dieu-khoan">(v) Thẻ HALMIANS và thẻ CJ Members; và</p>
          <p class="the-p-dieu-khoan">(vi) Điểm thưởng tích lũy của Thành viên HALM Việt Nam theo chương trình tích lũy điểm thưởng tại từng thời điểm.</p>
        </li>

        <li>
          <strong>CHI TIẾT CÁC HÌNH THỨC THANH TOÁN</strong>
          <p class="the-p-dieu-khoan">-  <span class="bold">Điểm thưởng tích lũy của Thành viên HALM Việt Nam (Membership Point):</span> Mỗi 01 điểm thưởng tương đương với 1.000 VND. Điểm thưởng này, bạn có thể sử dụng để (1) Thanh toán vé xem phim; (2) Mua các sản phẩm đồ ăn thức uống tại hệ thống HALM; (3) Đổi sang hàn trăm ngàn voucher ưu đãi các sản phẩm/dịch vụ của các bên đối tác thứ 3 trên HALM Reward/Đổi ưu đãi. Khi sử dụng điểm thưởng, bạn vui lòng xuất trình thẻ thành viên để được nhân viên hỗ trợ thanh toán. Điểm thưởng được sử dụng phải từ 20 điểm trở lên (Chưa có quy định cụ thể về mức điểm sử dụng tối thiểu đối với các sản phẩm voucher trên HALM Reward).</p>
          <p class="the-p-dieu-khoan">Để kiểm tra điểm thưởng, bạn vui lòng truy cập vào mục Tài Khoản HALM trên Ứng Dụng.</p>
          <p class="the-p-dieu-khoan">-  Thẻ quà Tặng HALM Cinemas (HALM Gift cards, HALM E-Gift cards), Phiếu đổi vé Xem phim HALM Cinemas (HALM vouchers, HALM E-vouchers): Với Thẻ Quà Tặng HALM Cinemas hoặc Phiếu đổi vé Xem phim HALM Cinemas vật lý, bạn có thể tìm mua tại các Cụm Rạp Chiếu Phim HALM Cinemas toàn quốc với các mệnh giá từ 100.000đ. Với Thẻ Quà Tặng HALM Cinemas hoặc Phiếu đổi vé Xem phim HALM Cinemas trực tuyến (HALM E-Gift cards, HALM E-vouchers) bạn có thể dễ dàng mua tại Ứng Dụng có các mệnh giá: 100.000đ - 200.000đ - 300.000đ - 500.000đ - 1.000.000đ.</p>
          <p class="the-p-dieu-khoan">Mỗi loại Phiếu đổi vé Xem phim HALM Cinemas sẽ có giá trị quy đổi và thời hạn sử dụng khác nhau. Bạn vui lòng đọc kỹ các điều khoản sử dụng ở mặt sau Phiếu đổi vé Xem phim HALM Cinemas để biết thêm chi tiết. Khi thanh toán trực tuyến, bạn vui lòng đăng ký mã Phiếu đổi vé Xem phim HALM Cinemas và mã PIN để thực hiện thanh toán. Xin lưu ý Phiếu đổi vé Xem phim HALM Cinemas vật lý sau khi mất lớp tráng bạc sẽ không thể đổi vé tại quầy.</p>
          <p class="the-p-dieu-khoan">Đặc biệt, bạn có thể gửi kèm lời chúc bí mật dành cho "người thương" qua Thẻ quà Tặng HALM Cinemas (HALM Gift cards, HALM E-Gift cards).</p>
          <p class="the-p-dieu-khoan">-  Ví Điện Tử (Momo, Zalopay, ShopeePay, Viettelpay) làm phương thức thanh toán trên Ứng Dụng. Hoặc nhanh chóng hơn bằng cách mở Ví MoMo và chọn mục "Mua Vé Xem Phim", xem thông tin chi tiết: Tại đây</p>
          <p class="the-p-dieu-khoan">-  Thẻ ATM (Thẻ ghi nợ/thanh toán /trả trước nội địa): Để thanh toán bằng thẻ ngân hàng nội địa, thẻ của khách hàng phải được đăng ký sử dụng tính năng thanh toán trực tuyến, hoặc ngân hàng điện tử của Ngân hàng. Giao dịch phải được ghi nhận thành công từ thông báo cấp phép thành công do hệ thống cổng thanh toán trả về (đảm bảo số dư/hạn mức và xác thực khách hàng theo quy định sử dụng của thẻ).</p>
          <p class="the-p-dieu-khoan">-  Thẻ tín dụng, thẻ thanh toán quốc tế, thẻ trả trước quốc tế: Thẻ tín dụng/ghi nợ/trả trước VISA, MasterCard, JCB, Union Pay, Amex của các Ngân hàng trong nước và nước ngoài phát hành. Giao dịch phải được ghi nhận cấp phép thành công do đúng hệ thống cổng thanh toán trả về (đảm bảo số dư/hạn mức và xác thực khách hàng theo quy định sử dụng của thẻ).</p>
        </li>

        <li>
          <strong>DANH SÁCH THẺ ĐƯỢC CHẤP NHẬN THANH TOÁN TRỰC TUYẾN</strong>
          <p class="the-p-dieu-khoan">(Cập nhật theo thông báo của nhà cung cấp dịch vụ)</p>
          <p class="the-p-dieu-khoan bold">Thẻ quốc tế:</p>
          <p class="the-p-dieu-khoan">- Visa</p>
          <p class="the-p-dieu-khoan">- MasterCard</p>
          <p class="the-p-dieu-khoan">- JCB</p>
          <p class="the-p-dieu-khoan">- American Express</p>
          <p class="the-p-dieu-khoan">- Union Pay</p>
          <p class="the-p-dieu-khoan bold">Thẻ nội địa:</p>
          <p class="the-p-dieu-khoan">- Ngân hàng Nông nghiệp và phát triển nông thôn - Agribank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Ngoại thương Việt Nam - Vietcombank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Đông Á - Dong A bank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Công thương Việt Nam - Vietinbank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Kỹ thương Việt Nam - Techcombank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Quốc tế Việt Nam - VIB.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Tiên phong - TienphongBank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Phát triển Nhà Tp.HCM - HDBank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Sài gòn - Hà Nội - SHB.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng Xuất nhập khẩu Việt Nam - Eximbank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Hàng Hải Việt Nam - MSB.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng Việt Á - VietA Bank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng Quân đội - MB.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Nam Á - Nam A Bank.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP Sài Gòn Thương Tín - Sacombank.</p>
          <p class="the-p-dieu-khoan">- Ngân Hàng TMCP Đông Nam Á - SeABank.</p>
          <p class="the-p-dieu-khoan">- Ngân Hàng TMCP Đại Dương - OceanBank.</p>
          <p class="the-p-dieu-khoan">- Ngân Hàng Đầu Tư và Phát triển Việt Nam - BIDV.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng Việt Nam Thịnh Vượng - VPBank.</p>
          <p class="the-p-dieu-khoan">- Ngân Hàng TMCP Bắc Á - BAC A BANK.</p>
          <p class="the-p-dieu-khoan">- Ngân hàng TMCP AN BÌNH - ABBANK.</p>
        </li>


        <li>
          <strong>TRƯỜNG HỢP GIAO DỊCH THANH TOÁN KHÔNG THÀNH CÔNG</strong>
          <p class="the-p-dieu-khoan">Giao dịch thanh toán không thành công có thể do nhiều nguyên nhân. Bạn tham khảo các nguyên nhân sau:</p>
          <p class="the-p-dieu-khoan">Giao dịch thanh toán không thành công có thể do nhiều nguyên nhân. Bạn tham khảo các nguyên nhân sau:</p>
          <p class="the-p-dieu-khoan">- Chưa đăng ký chức năng thanh toán trên Internet với Ngân hàng</p>
          <p class="the-p-dieu-khoan">- Đối với thẻ Visa, MasterCard: Trong quá trình thanh toán, có thể bạn được yêu cầu nhập Mật khẩu của chương trình Verified by Visa hoặc MasterCard SecureCode... nhưng bạn đã không hoàn thành bước xác thực này.</p>
          <p class="the-p-dieu-khoan">- Thẻ không đủ hạn mức/ số dư để thanh toán. Một số Ngân hàng có quy định cả hạn mức chi tiêu theo ngày cho thẻ.</p>
          <p class="the-p-dieu-khoan">- Nhập sai thông tin thẻ.</p>
          <p class="the-p-dieu-khoan">Vui lòng liên hệ hotline 1900 6017 hoặc Ngân hàng phát hành thẻ để tìm hiểu nguyên nhân chính xác.</p>
        </li>

    </ol>
        </div>
    </div>
<!----------------------------------------------- FINISH ĐIỀU KHOẢN CHUNG----------------------------------------------------------------------->



<!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
<jsp:include page="footer.jsp"/>


<!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

    <script src="Script/script.js"></script>

</body>

</html>
