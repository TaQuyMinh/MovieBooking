<%-- 
    Document   : dactrung4DX
    Created on : Jul 4, 2024, 11:51:06 AM
    Author     : HAO
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>4DX</title>
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
        <div class="swiper-container">

            <div class="slider-wrapper">

                <div class="image-list">
                    <a href="dactrung4DX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/4DX.png" alt="4DX" class="image-item selected"></a>
                    <a href="dactrungIMAX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/IMAX.png" alt="IMAX" class="image-item "></a>
                    <a href="dactrungGoldclass.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/GoldClass.png" alt="GoldClass" class="image-item"></a>
                    <a href="dactrungLamour.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Lamour.png" alt="Lamour" class="image-item"></a>
                    <a href="dactrungStarium.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Starium.png" alt="Stadium" class="image-item"></a>
                    <a href="dactrungPremier.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Premium.png" alt="Premium" class="image-item"></a>
                    <a href="dactrungScreenX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/ScreenX.png" alt="ScreenX" class="image-item"></a>
                    <a href="dactrung3D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/3D.png" alt="" class="image-item"></a>
                    <a href="dactrung4D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/4D.png" alt="" class="image-item"></a>
                </div>

            </div> 
        </div>

        <img class="anh" src="images/Black Grey Minimalist Modern Cinema Logo/4DX.png" alt="">

        <p class="noi-dung">4DX®, một định dạng điện ảnh hoàn toàn mới đánh thức mọi giác quan của khán giả mang đến những trải nghiệm điện ảnh tuyệt đỉnh bằng công nghệ hiện đại nhất trên thế giới.</p>

        <div class="container">

            <div class="slide">


                <div class="item" style="background-image: url(images/1_4dx.jpg);">
                    <div class="content">
                        <div class="name">4DX® - Trải Nghiệm Điện Ảnh Toàn Diện</div>
                        <p class="des">Đã đến lúc thưởng thức phim ảnh theo cách hoàn toàn khác!</p>
                        <p class="des">Hòa mình và trải nghiệm cảm giác sống chân thực trên màn ảnh bằng tất cả các giác quan của bạn.</p>
                    </div>
                </div>
                <div class="item" style="background-image: url(images/2_4dx.jpg);">
                    <div class="content">
                        <div class="name">Đặc Trưng Nổi Bật Của 4DX®</div>
                        <p class="des">4DX® mang đến cho khán giả hai loại hiệu ứng: hiệu ứng ghế chuyển động đa chiều và hiệu ứng môi trường tương tác xung quanh.</p>
                        <p class="des">Ghế 4D bao gồm 3 kiểu chuyển động cơ bản: Xoay, rung lắc và nâng. Các chuyển động này được kết hợp để tạo ra cảm giác sống động vượt trội.</p>

                    </div>
                </div>
                <div class="item" style="background-image: url(images/3_4dx.jpg);">
                    <div class="content">
                        <div class="name">Các Hiệu Ứng Đặc Trưng Của 4DX®</div>
                        <p class="des">- Chuyển động: Ghế chuyển động đa chiều cho phản ứng chân thực với các tác động từ màn ảnh.</p>
                        <p class="des">- Nước: Thiết bị phun nước đặc biệt mang lại những trải nghiệm điện ảnh sống động.</p>
                        <p class="des">- Gió: Hệ thống “Phun khí cổ” được cài đặt trên ghế thổi luồng gió trực tiếp lên cổ.</p>
                        <p class="des">- Mùi Hương: Chìm đắm vào không gian trong mỗi cảnh phim với trải nghiệm mùi Hương chân thật.</p>
                        <p class="des">- Ánh sáng: Hiệu ứng ánh sáng đặc biệt tạo tia chớp được lắp đặt ngay bên trên trần khán phòng.</p>

                    </div>
                </div>
                <div class="item" style="background-image: url(images/4_4dx.jpg);">
                    <div class="content">
                        <div class="name">Những Điều Cần Biết Khi Thưởng Thức 4DX®</div>
                        <p class="des">- Phụ nữ đang mang thai, người già, người có thể chất và thần kinh yếu không nên sử dụng ghế 4DX®.</p>
                        <p class="des">- Không để trẻ nhỏ ngồi ghế nâng hoặc ngồi chung với bố mẹ.</p>
                    </div>
                </div>


            </div>

            <div class="button">
                <button class="prebtn prev "><i class="fa-solid fa-arrow-left"></i></button>
                <button class="nextbtn next "><i class="fa-solid fa-arrow-right"></i></button>
            </div>

        </div>



        <iframe class="video"
                width="1000" 
                height="500" 
                src="https://www.youtube.com/embed/mDX1Pz8HPRs?si=JrI-K2W_0GBZO6EH" 
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

