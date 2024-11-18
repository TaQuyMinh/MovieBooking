<%-- 
    Document   : dactrungScreenX
    Created on : Jul 4, 2024, 12:01:18 PM
    Author     : HAO
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>SCREEN X</title>
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
            <a href="dactrungIMAX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/IMAX.png" alt="IMAX" class="image-item "></a>
            <a href="dactrungGoldclass.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/GoldClass.png" alt="GoldClass" class="image-item"></a>
            <a href="dactrungLamour.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Lamour.png" alt="Lamour" class="image-item"></a>
            <a href="dactrungStarium.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Starium.png" alt="Stadium" class="image-item"></a>
            <a href="dactrungPremier.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Premium.png" alt="Premium" class="image-item"></a>
            <a href="dactrungScreenX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/ScreenX.png" alt="ScreenX" class="image-item selected"></a>
            <a href="dactrung3D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/3D.png" alt="" class="image-item"></a>
            <a href="dactrung4D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/4D.png" alt="" class="image-item"></a>
        </div>

        <img class="anh" src="images/Black Grey Minimalist Modern Cinema Logo/ScreenX.png" alt="">

        <p class="noi-dung">ScreenX vượt qua khuôn khổ giới hạn của màn hình chính và phóng đại không gian hình ảnh sang hai bên tường đến tận hàng ghế cuối cùng.</p>

        <div class="container">

            <div class="slide">


                <div class="item" style="background-image: url(images/screenx-1.jpg);">
                    <div class="content">
                        <div class="name">Trải Nghiệm Thị Giác Vượt Trội</div>
                        <p class="des">Với độ phủ hình ảnh gấp ba lần so với tiêu chuẩn màn chiếu thông thường, ScreenX mang lại những thước phim thật sống động.</p>
                    </div>
                </div>

                <div class="item" style="background-image: url(images/screenx-2.jpg);">
                    <div class="content">
                        <div class="name">Khung Cảnh 3D Thực Tế</div>
                        <p class="des">ScreenX là công nghệ chiếu phim với màn hình đa diện đầu tiên trên thế giới, cho người xem trải nghiệm hình ảnh 270 độ, mở rộng từ màn hình chính và trải dài sang hai bên tường.</p>        
                    </div>
                </div>

                <div class="item" style="background-image: url(images/screenx-3.jpg);">
                    <div class="content">
                        <div class="name">Sản Xuất Kỳ Công</div>
                        <p class="des">Để có những cảnh phim ScreenX chỉ từ 15 đến 20 phút trong mỗi bộ phim, các nhà làm phim phải sử dụng ít nhất 3 máy quay với 3 góc quay khác nhau cho mỗi phân cảnh để tái hiện khung cảnh bộ phim một cách chân thật.</p>
                    </div>
                </div>

            </div>

            <div class="button">
                <button class="prev"><i class="fa-solid fa-arrow-left"></i></button>
                <button class="next"><i class="fa-solid fa-arrow-right"></i></button>
            </div>

        </div>



        <iframe 
            class="video"
            width="1000" 
            height="500" 
            src="https://www.youtube.com/embed/mC4pOhxCqp0?si=gNSdCeeP3n7vFLDr" 
            title="YouTube video player" frameborder="0" 
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
            referrerpolicy="strict-origin-when-cross-origin" 
            allowfullscreen>
        </iframe>






        <!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
        <jsp:include page="footer.jsp"/>



        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

        <script src="Script/dactrungscripts.js"></script>

    </body>

</html>

