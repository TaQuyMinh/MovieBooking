<%-- 
    Document   : IMAX
    Created on : Jul 4, 2024, 11:56:50 AM
    Author     : HAO
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>IMAX</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <script src='main.js'></script>
        <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/dactrungHALM.css">
         <link rel="stylesheet" href="css/styleindex.css" />

        <!---Font answer cdn-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />


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
        <div class="dactrung">
            <div id="dactrungTitle">
                <p>Đặc trưng HALM</p>
            </div>
        </div>


        <!----------------------------------ĐẶC TRƯNG HALM---------------------------------------------------------------------------------->


        <div class="image-list">
            <a href="dactrung4DX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/4DX.png" alt="4DX" class="image-item"></a>
            <a href="dactrungIMAX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/IMAX.png" alt="IMAX" class="image-item selected "></a>
            <a href="dactrungGoldclass.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/GoldClass.png" alt="GoldClass" class="image-item"></a>
            <a href="dactrungLamour.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Lamour.png" alt="Lamour" class="image-item"></a>
            <a href="dactrungStarium.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Starium.png" alt="Stadium" class="image-item"></a>
            <a href="dactrungPremier.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Premium.png" alt="Premium" class="image-item"></a>
            <a href="dactrungScreenX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/ScreenX.png" alt="ScreenX" class="image-item"></a>
            <a href="dactrung3D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/3D.png" alt="" class="image-item"></a>
            <a href="dactrung4D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/4D.png" alt="" class="image-item"></a>
        </div>

        <img class="anhIMAX" src="images/Black Grey Minimalist Modern Cinema Logo/IMAX2.png" alt="">

        <p class="noi-dung">IMAX là công nghệ chiếu phim tiên tiến nhất trên thế giới hiện nay, từ thiết kế phòng chiếu vô cùng choáng ngợp đến hiệu ứng âm thanh và hình ảnh đỉnh cao.</p>

        <div class="container">

            <div class="slide">


                <div class="item" style="background-image: url(images/big-screen-imax.jpg);">
                    <div class="content">
                        <div class="name">Trải nghiệm trọn vẹn bộ phim với màn hình cong cỡ lớn</div>
                        <p class="des">Màn hình của phòng chiếu IMAX® không chỉ đơn thuần là màn hình cỡ lớn, mà độ cong của màn hình cũng được thiết kế đến mức cực đại. Thiết kế cong của màn hình nhằm đưa hình ảnh lấp đầy tầm nhìn, biến mỗi thước phim trở nên ấn tượng tuyệt đối. Góc nhìn của người xem trong phòng chiếu thường là 54 độ, với IMAX® đó là 70 độ!</p>
                        <p class="des">Đặc biệt, với khoảng cách giữa màn hình, ghế ngồi và độ nghiêng của sàn, khán giả có thể thưởng thức trọn vẹn bộ phim tại bất kì vị trí nào trong phòng chiếu IMAX®.</p>
                    </div>
                </div>

                <div class="item" style="background-image: url(images/hight-light-screen-imax.jpg);">
                    <div class="content">
                        <div class="name">Hình ảnh sắc nét với IMAX DMR®</div>
                        <p class="des">Với phòng chiếu IMAX®, bạn như đang bước vào thế giới của chính bộ phim. Hình ảnh không chỉ được mở rộng để phù hợp với kích thước cực đại của màn hình, mà nó còn được chuyển hóa hoàn toàn.</p>
                        <p class="des">phối hợp chặt chẽ với các nhà làm phim trong quá trình được gọi là IMAX DMR® (Digital Re-mastering), để nâng cao chất lượng của hàng trăm chi tiết trong phần lớn các cảnh phim và mang tới hình ảnh cực kỳ sắc nét.</p>

                    </div>
                </div>

                <div class="item" style="background-image: url(images/double-screen-imax.jpg);">
                    <div class="content">
                        <div class="name">Chân thực tuyệt đối với máy chiếu đôi</div>
                        <p class="des">Khác với phòng chiếu thường chỉ 1 máy chiếu, phòng chiếu IMAX® sở hữu độc quyền và trang bị hệ thống máy chiếu đôi, giúp tăng cường màu ảnh lên tới 40% và độ sáng tới 60%. Đặc biệt, hệ thống còn được tích hợp cảm biến để ghi lại sự thiếu đồng nhất và tự động điều chỉnh, nhằm đảm bảo chất lượng hình ảnh đẹp tối đa trong suốt thời gian của bộ phim</p>                 
                    </div>
                </div>

                <div class="item" style="background-image: url(images/senior-imax.jpg);">
                    <div class="content">
                        <div class="name">Tầm cao mới cùng IMAX® 3D</div>
                        <p class="des">Khi thưởng thức IMAX® 3D, người xem sẽ cảm nhận màu sắc và độ sáng của từng hình ảnh được tăng cường tối đa. Đây là kết quả của hiệu ứng xuất ảnh từ 2 máy chiếu vào màn hình tráng bạc đặc biệt, mang đến trải nghiệm 3D khác biệt hoàn toàn với tất cả các công nghệ 3D khác.</p>                    </div>
                </div>

                <div class="item" style="background-image: url(images/sound-imax.jpg);">
                    <div class="content">
                        <div class="name">Âm thanh sống động với IMAX® Sound</div>
                        <p class="des">Hệ thống loa của phòng chiếu IMAX® được xây dựng từ sàn tới trần nhà và sắp xếp cực kỳ chuẩn xác nhằm phân bổ âm thanh tới từng vị trí ghế ngồi. Khán giả sẽ có không gian tối ưu nhất để thưởng thức và cảm nhận cả những âm thanh nhỏ nhất của bộ phim. IMAX® cũng sử dụng micro để thu thập dữ liệu từ hệ thống loa và tự động điều chỉnh hàng ngày. Đặc biệt, với âm thanh đã được điều chỉnh trong quá trình IMAX DMR® , kết hợp với hệ thống âm thanh của phòng chiếu IMAX®, cả khán phòng sẽ cùng đắm chìm trong thế giới của bộ phim.</p>                    </div>
                </div>


            </div>

            <div class="button">
                <button class="prev"><i class="fa-solid fa-arrow-left"></i></button>
                <button class="next"><i class="fa-solid fa-arrow-right"></i></button>
            </div>

        </div>







        <!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
        <jsp:include page="footer.jsp"/>

        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

        <script src="Script/dactrungscripts.js"></script>

    </body>

</html>

