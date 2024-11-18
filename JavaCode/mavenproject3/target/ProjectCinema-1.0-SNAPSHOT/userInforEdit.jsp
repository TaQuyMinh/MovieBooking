<%-- 
    Document   : userInforEdit
    Created on : Jun 28, 2024, 2:01:29 PM
    Author     : luula
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh sửa thông tin người dùng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                margin-bottom: 10px;
            }
            ul {
                list-style-type: none;
                padding: 0;
            }
            li {
                margin-bottom: 15px;
            }
            input[type="text"], input[type="date"], select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .button-group {
                display: flex;
                justify-content: space-between;
            }
            input[type="submit"] {
                width: 48%;
                padding: 10px;
                border: none;
                border-radius: 4px;
                background-color: #5cb85c;
                color: white;
                font-size: 16px;
                cursor: pointer;
                margin-top: 10px;
            }
            input[type="submit"].cancel {
                background-color: #d9534f;
            }
            input[type="submit"]:hover {
                opacity: 0.8;
            }
        </style>
    </head>
    <body>
        <form action="UserInforController" method="POST">
            <ul>
                <li>Tên: <input type="text" name="name" value="${user.name}"></li>
                <li>Mật khẩu mới <input type="text" name="newPassword" value="${user.password}"></li>
                <li>Email: <input type="text" name="email" value="${user.email}"></li>
                <li>Số điện thoại: <input type="text" name="phoneNumber" value="${user.phoneNumber}"></li>
                <li>Giới tính: 
                    <select name="gender">
                        <option value="male" ${user.gender == 'male' ? 'selected' : ''}>Nam</option>
                        <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Nữ</option>
                    </select>
                </li>
                <li>Khu vực:
                    <select name="address" class="input-field form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
                    <option value="${user.address}" selected>${user.address}</option>
                    <option value="Hà Nội" >Hà Nội</option>
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
                </li>
                <li>Ngày sinh: <input type="date" name="birthday" value="${user.birthday}"></li>
            </ul>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="username" value="${user.username}">
            <div class="button-group">
                <input type="submit" value="Lưu">
        </form>
                <form action="UserInforController" method="POST">
                    <input type="hidden" name="action" value="cancel">
                    <input type="hidden" name="username" value="${user.username}">
                    <input type="submit" value="Hủy" class="cancel">
                </form>
            </div>
    </body>
</html>
