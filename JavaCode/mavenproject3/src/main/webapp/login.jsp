<%-- 
    Document   : login
    Created on : Jun 14, 2024, 8:06:46 PM
    Author     : HAO
--%>

<%@page import="project.Users.UserDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập/ Đăng ký</title>

        <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Datepicker CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/styleindex.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

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

        <!---------------------------------------------------------FORM---------------------------------------------------------------------->

        <div class="form-box">
            <div class="button">
                <div id="btn"></div>
                <div class="flex">
                    <button type="button" class="toggle-btn" onclick="login()">ĐĂNG NHẬP</button>
                    <button type="button" class="toggle-btn" onclick="register()">ĐĂNG KÝ</button>
                </div>
            </div>

            <!---------------------------------------------------------LOGIN--------------------------------------------------------------------->

            <form action="./login" name="" method="GET" id="login" class="input">
                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                <h3> <%=error%></h3>
                <%
                    }
                %>

                    
                <%
                    Cookie[] cookies = request.getCookies();
                    String rememberedUser = "";
                    String rememberedPass = "";
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if ("username".equals(cookie.getName())) {
                                rememberedUser = cookie.getValue();
                            }
                            if ("password".equals(cookie.getName())) {
                                rememberedPass = cookie.getValue();
                            }
                        }
                    }
                %>     
                
                <input name ="user" type="text" class="input-field" placeholder="Nhập tên đăng nhập " value="<%= rememberedUser %>" required>
                <input name =  "password" type="password" class="input-field" autocomplete="off" placeholder="Nhập mật khẩu" value="<%= rememberedPass %>" required>
                <input name = "remember" value="true" type="checkbox" class="check-box" <%= !rememberedUser.isEmpty() ? "checked" : "" %> > <span>Ghi nhớ đăng nhập</span>
                <input name="action" value="login" type="hidden">
                <button  value = "Login" type="submit" class="submit-btn">Đăng Nhập</button>
                <span class="miss"> <a href="#">Quên mật khẩu?</a></span>
            </form>

            <!---------------------------------------------------------REGISTER------------------------------------------------------------------>

            <form action="register" name="" method="POST" id="register" class="input">
                <%
                    String notice = (String) request.getAttribute("notice");
                    if (notice != null) {
                %>
                <h3> <%=notice%></h3>
                <%
                    }
                %>
                <input name ="name" type="text" class="input-field" placeholder="Tên" required>
                <input name ="phoneNumber" type="text" class="input-field" placeholder="Nhập số điện thoại" required>
                <input name ="email" type="email" class="input-field" placeholder="Nhập email" required>
                <input name ="username" type="text" class="input-field" placeholder="Nhập tên đăng nhập" required>
                <input name ="Password" type="password" class="input-field" placeholder="Nhập mật khẩu" required>

                <select name="address" class="input-field form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
                    <option  value="" selected>Khu vực</option>
                    <option value="Hà Nội">Hà Nội</option>
                    <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                    <option value="Đà Nẵng">Đà Nẵng</option>
                    <option value="Hải Phòng">Hải Phòng</option>
                    <option value="Cần Thơ">Cần Thơ</option>
                    <option value="An Giang">An Giang</option>
                    <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                    <option value="Bắc Giang">Bắc Giang</option>
                    <option value="Bắc Kạn">Bắc Kạn</option>
                    <option value="Bạc Liêu">Bạc Liêu</option>
                    <option value="Bắc Ninh">Bắc Ninh</option>
                    <option value="Bến Tre">Bến Tre</option>
                    <option value="Bình Định">Bình Định</option>
                    <option value="Bình Dương">Bình Dương</option>
                    <option value="Bình Phước">Bình Phước</option>
                    <option value="Bình Thuận">Bình Thuận</option>
                    <option value="Cà Mau">Cà Mau</option>
                    <option value="Cao Bằng">Cao Bằng</option>
                    <option value="Đắk Lắk">Đắk Lắk</option>
                    <option value="Đắk Nông">Đắk Nông</option>
                    <option value="Điện Biên">Điện Biên</option>
                    <option value="Đồng Nai">Đồng Nai</option>
                    <option value="Đồng Tháp">Đồng Tháp</option>
                    <option value="Gia Lai">Gia Lai</option>
                    <option value="Hà Giang">Hà Giang</option>
                    <option value="Hà Nam">Hà Nam</option>
                    <option value="Hà Tĩnh">Hà Tĩnh</option>
                    <option value="Hải Dương">Hải Dương</option>
                    <option value="Hậu Giang">Hậu Giang</option>
                    <option value="Hòa Bình">Hòa Bình</option>
                    <option value="Hưng Yên">Hưng Yên</option>
                    <option value="Khánh Hòa">Khánh Hòa</option>
                    <option value="Kiên Giang">Kiên Giang</option>
                    <option value="Kon Tum">Kon Tum</option>
                    <option value="Lai Châu">Lai Châu</option>
                    <option value="Lâm Đồng">Lâm Đồng</option>
                    <option value="Lạng Sơn">Lạng Sơn</option>
                    <option value="Lào Cai">Lào Cai</option>
                    <option value="Long An">Long An</option>
                    <option value="Nam Định">Nam Định</option>
                    <option value="Nghệ An">Nghệ An</option>
                    <option value="Ninh Bình">Ninh Bình</option>
                    <option value="Ninh Thuận">Ninh Thuận</option>
                    <option value="Phú Thọ">Phú Thọ</option>
                    <option value="Phú Yên">Phú Yên</option>
                    <option value="Quảng Bình">Quảng Bình</option>
                    <option value="Quảng Nam">Quảng Nam</option>
                    <option value="Quảng Ngãi">Quảng Ngãi</option>
                    <option value="Quảng Ninh">Quảng Ninh</option>
                    <option value="Quảng Trị">Quảng Trị</option>
                    <option value="Sóc Trăng">Sóc Trăng</option>
                    <option value="Sơn La">Sơn La</option>
                    <option value="Tây Ninh">Tây Ninh</option>
                    <option value="Thái Bình">Thái Bình</option>
                    <option value="Thái Nguyên">Thái Nguyên</option>
                    <option value="Thanh Hóa">Thanh Hóa</option>
                    <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                    <option value="Tiền Giang">Tiền Giang</option>
                    <option value="Trà Vinh">Trà Vinh</option>
                    <option value="Tuyên Quang">Tuyên Quang</option>
                    <option value="Vĩnh Long">Vĩnh Long</option>
                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                    <option value="Yên Bái">Yên Bái</option>
                    <option value="Bắc Ninh">Bắc Ninh</option>
                    <option value="Hà Tĩnh">Hà Tĩnh</option>
                    <option value="Ninh Thuận">Ninh Thuận</option>


                </select>

                <div class="form-group dob-group">
                    <label for="dob-day">Ngày sinh</label>
                    <div class="dob-selects">
                        <select name="dob-day" class="input-field" id="dob-day" required></select>
                        <select name="dob-month" class="input-field" id="dob-month" required></select>
                        <select name="dob-year" class="input-field" id="dob-year" required></select>
                    </div>
                </div>

                <select name="gender" class="input-field form-select form-select-sm mb-3" id="gender" aria-label=".form-select-sm">
                    <option value="" selected>Giới tính</option>
                    <option value="male">Nam</option>
                    <option value="female">Nữ</option>
                    <option value="other">Khác</option>
                </select>

                <input type="checkbox" class="check-box"> <span>Tôi đồng ý với <a href="DieukhoanChung.html">ĐIỀU KHOẢN CỦA HALM</a></span>
                <button type="submit" class="submit-btn">Đăng Ký</button>
            </form>
        </div>
                
        <jsp:include page="footer.jsp"/>        


        <!---------------------------------------------------------FINISH FOOTER------------------------------------------------------------->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        <script>
                        var x = document.getElementById("login");
                        var y = document.getElementById("register");
                        var z = document.getElementById("btn");

                        function register() {
                            x.style.left = "-400px";
                            y.style.left = "50px";
                            z.style.left = "110px";
                        }

                        function login() {
                            x.style.left = "50px";
                            y.style.left = "450px";
                            z.style.left = "0px";
                        }

                        //---------------------------------------------------------CHỌN NGÀY THÁNG NĂM SINH-------------------------------------------------------------

                        document.addEventListener('DOMContentLoaded', (event) => {
                            const days = document.getElementById('dob-day');
                            const months = document.getElementById('dob-month');
                            const years = document.getElementById('dob-year');

                            // Populate days
                            for (let d = 1; d <= 31; d++) {
                                const option = document.createElement('option');
                                option.value = d;
                                option.text = d;
                                days.appendChild(option);
                            }

                            // Populate months
                            const monthNames = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"];
                            monthNames.forEach((month, index) => {
                                const option = document.createElement('option');
                                option.value = index + 1;
                                option.text = month;
                                months.appendChild(option);
                            });

                            // Populate years
                            const currentYear = new Date().getFullYear();
                            const startYear = 1900;
                            for (let y = currentYear; y >= startYear; y--) {
                                const option = document.createElement('option');
                                option.value = y;
                                option.text = y;
                                years.appendChild(option);
                            }
                        });

                        //---------------------------------------------------------CHỌN KHU VỰC-------------------------------------------------------------
//            var citis = document.getElementById("city");
//            var districts = document.getElementById("district");
//            var Parameter = {
//                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
//                method: "GET",
//                responseType: "application/json",
//            };
//            var promise = axios(Parameter);
//            promise.then(function (result) {
//                renderCity(result.data);
//            });
//
//            function renderCity(data) {
//                for (const x of data) {
//                    citis.options[citis.options.length] = new Option(x.Name, x.Id);
//                }
//                citis.onchange = function () {
//                    districts.length = 1;
//                    const result = data.filter(n => n.Id === this.value);
//
//                    for (const k of result[0].Districts) {
//                        districts.options[districts.options.length] = new Option(k.Name, k.Id);
//                    }
//                };
//            }
        </script>
    </body>
</html>
