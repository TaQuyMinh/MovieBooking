<%-- 
    Document   : dactrungStarium
    Created on : Jul 4, 2024, 12:02:20 PM
    Author     : HAO
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>STARIUM</title>
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
            <a href="dactrungStarium.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Starium.png" alt="Stadium" class="image-item selected"></a>
            <a href="dactrungPremier.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Premium.png" alt="Premium" class="image-item"></a>
            <a href="dactrungScreenX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/ScreenX.png" alt="ScreenX" class="image-item"></a>
            <a href="dactrung3D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/3D.png" alt="" class="image-item"></a>
            <a href="dactrung4D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/4D.png" alt="" class="image-item"></a>
        </div>

        <img class="anhStarium" src="images/Black Grey Minimalist Modern Cinema Logo/Starium.png" alt="">

        <p class="noi-dung">STARIUM là công nghệ chiếu phim do chính CGV sáng tạo ra để những trải nghiệm của khán giả vượt xa cả giới hạn chân thực.</p>

        <div class="container">

            <div class="slide">


                <div class="item" style="background-image: url(images/Starium1.jpg);">
                    <div class="content">
                        <div class="name">Máy Chiếu Laser Christie</div>
                        <p class="des">Hệ thống máy chiếu laser RGB CHRISTIE thế hệ mới nhất cung cấp độ sáng, độ tương phản, độ phân giải và mật độ điểm ảnh cực cao, khắc phục những khuyết điểm của các phim 3D như ánh sáng bị tối, nhòe làm bật lên độ sống động đầy kinh ngạc và đạt đến đẳng cấp siêu hạng của sự chân thật.</p>
                    </div>
                </div>

                <div class="item" style="background-image: url(images/starium-2.jpg);">
                    <div class="content">
                        <div class="name">Âm Thanh Dolby Atmos Hiện Đại</div>
                        <p class="des">Thưởng thức hệ thống âm thanh mái vòm Dolby Atmos mang đến cho khán giả cảm giác sống trong từng thước phim bởi sự thỏa mãn ở mọi giác quan.</p>
                    </div>
                </div>

                <div class="item" style="background-image: url(images/starium-3.jpg);">
                    <div class="content">
                        <div class="name">Màn Hình Cực Lớn</div>
                        <p class="des">Màn hình với kích thước khổng lồ, đem đến góc nhìn tốt nhất cho mọi vị trí trong phòng chiếu.</p>                 
                    </div>
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
