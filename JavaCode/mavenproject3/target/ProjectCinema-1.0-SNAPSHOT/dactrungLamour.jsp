<%-- 
    Document   : dactrungLamour
    Created on : Jul 4, 2024, 11:58:08 AM
    Author     : HAO
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>L'AMOUR</title>
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
            <a href="dactrungLamour.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Lamour.png" alt="Lamour" class="image-item selected"></a>
            <a href="dactrungStarium.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Starium.png" alt="Stadium" class="image-item"></a>
            <a href="dactrungPremier.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/Premium.png" alt="Premium" class="image-item"></a>
            <a href="dactrungScreenX.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/ScreenX.png" alt="ScreenX" class="image-item"></a>
            <a href="dactrung3D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/3D.png" alt="" class="image-item"></a>
            <a href="dactrung4D.jsp"><img src="images/Black Grey Minimalist Modern Cinema Logo/4D.png" alt="" class="image-item"></a>
        </div>

        <img class="anhLamour" src="images/Black Grey Minimalist Modern Cinema Logo/Lamour.png" alt="">

        <p class="noi-dung">Với mục đích mang đến khoảnh khắc ngọt ngào và cảm giác thoải mái nhất khi xem phim, CGV mang đến phòng chiếu giường nằm L’amour với thiết kế nội thất sang trọng bậc nhất trong hệ thống rạp CGV hứa hẹn trải nghiệm tuyệt vời cho khán giả.</p>

        <img class="anh-GoldClass" src="images/Lamour1.jpg">
        <img class="anh-GoldClass" src="images/Lamour2.jpg">
        <img class="anh-GoldClass" src="images/Goldclass3.jpg">
        <img class="anh-GoldClass" src="images/Goldclass4.jpg">    
        <img class="anh-GoldClass" src="images/Goldclass5.jpg">
        <img class="anh-GoldClass" src="images/Goldclass6.jpg">

        <br>
        <br>
        <br>
        <br>


        <!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
        <jsp:include page="footer.jsp"/>



        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

        <script src="Script/dactrungscripts.js"></script>

    </body>

</html>

