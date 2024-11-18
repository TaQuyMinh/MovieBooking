<%-- 
    Document   : prebookticket
    Created on : Jul 6, 2024, 11:35:13 AM
    Author     : HAO
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>ĐẶT VÉ</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <script src='main.js'></script>
        <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Embed CSS here -->
        <link rel="stylesheet" href="css/styleindex.css">
        <link rel="stylesheet" href="css/timebooking.css">

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
        <jsp:include page="header.jsp" />  

        <div class="container">
            <div class="title-box" style="margin-top: 30px;margin-bottom: 20px;">
                <h3 style="margin-top: 10px; ">CHỌN THÔNG TIN</h3>
            </div>

            <!----------------------------------------------- Hiển thị nội dung phim đã chọn ----------------------------------------------------------------------->
            <div class="movie-info">
                <img src="${movie.poster}" alt="Poster Phim" style="width: 150px;height:150px;">
                <div class="movie-details">
                    <p><strong>Tên phim:</strong>${movie.title}</p>
                    <p><strong>Thể loại: </strong>${movie.genre}</p>
                    <p><strong>Thời lượng: </strong>${movie.duration} phút</p>
                    <p><strong>Khởi chiếu: </strong>${dateFormat.format(movie.releaseDate)}</p>
                </div>
            </div>

            <!----------------------------------------------- Form chuyển trang ----------------------------------------------------------------------->
            <form id="selectionForm" method="post" action="SeatBookingController">
                <input type="hidden" name="selectedDay" id="selectedDay" value="${selectedDay}">
                <input type="hidden" name="selectedProvince" id="selectedProvince" value="">
                <input type="hidden" name="selectedFormat" id="selectedFormat" value="">
                <input type="hidden" name="movieName" id="movieName" value="${movie.title}">
                <input type="hidden" name="movieID" id="movieID" value="${movie.movieID}">
                <input type="hidden" name="posterUrl" id="posterUrl" value="${movie.poster}">
                <input type="hidden" name="selectedTime" id="selectedTime" value="">
                <input type="hidden" name="selectedCinema" id="selectedCinema" value="${cinemaName}">
                <input type="hidden" name="theatreID" id="theatreID" value="${theatreID}">

                <!----------------------------------------------- Các nút bấm chọn Ngày, Thành phố, Format, Suất chiếu ----------------------------------------------------------------------->
                <div class="calendar">
                    <c:forEach var="day" items="${daylist}">
                        <button type="button" class="day" onclick="selectDay('${day.date}')">${dateFormat.format(day.date)} ${day.dayName}</button>
                    </c:forEach>
                </div>
                <div class="cities">
                    <c:forEach var="province" items="${provincelist}">
                        <button type="button" class="province" onclick="selectProvince('${province.name}')">${province.name}</button>
                    </c:forEach>
                </div>
                <div class="formats">
                    <c:forEach var="format" items="${formatlist}">
                        <a href="#" onclick="selectFormat('${format.formatName}'); return false;">${format.formatName}</a>
                    </c:forEach>
                </div>
                <div class="cinemas" id="cinemaList"></div>
            </form>
        </div>

        <jsp:include page="footer.jsp" />

        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!----------------------------------------------- Phần Javascript truyền data cho các nút chọn ----------------------------------------------------------------------->
        <script>
                            var cinemas = {
            <c:forEach var="province" items="${provincelist}" varStatus="provinceStatus">
                            "${province.name}": {
                <c:forEach var="day" items="${daylist}" varStatus="dayStatus">
                            "${day.date}": {
                    <c:forEach var="format" items="${formatlist}" varStatus="formatStatus">
                    "${format.formatName}": [
                        <c:forEach var="cinema" items="${cinemalist}" varStatus="cinemaStatus">
                            <c:if test="${cinema.provinceID == province.provinceID}">
                            {name: "${cinema.name}", showtimes: [
                                <c:forEach var="showtime" items="${showtimelist}" varStatus="showtimeStatus">
                                    <c:if test="${showtime.movieID == movie.movieID && showtime.dayID == day.dayID && showtime.formatID == format.formatID && showtime.provinceID == province.provinceID && showtime.cinemaID == cinema.cinemaID}">
                            "${showtime.startTime} ${showtime.theatreID}"
                                        <c:set var="cinemaName" value="${cinema.name}"></c:set>
                                        <c:set var="selectedDay" value="${dateFormat.format(day.date)}"></c:set>
                                        <c:set var="theatreID" value="${showtime.theatreID}"></c:set>
                                        <c:if test="${!showtimeStatus.last}">,</c:if>
                                    </c:if>
                                </c:forEach>
                                ]}
                            </c:if>
                            <c:if test="${!cinemaStatus.last}">,</c:if>
                        </c:forEach>
                                ]
                        <c:if test="${!formatStatus.last}">,</c:if>
                    </c:forEach>
                                }
                    <c:if test="${!dayStatus.last}">,</c:if>
                </c:forEach>
                                }
                <c:if test="${!provinceStatus.last}">,</c:if>
            </c:forEach>
                                };
                                function selectDay(day) {
                                document.getElementById('selectedDay').value = day;
                                var days = document.querySelectorAll('.calendar .day');
                                days.forEach(function (btn) {
                                btn.classList.remove('selected');
                                });
                                event.target.classList.add('selected');
                                updateCinemas(document.getElementById('selectedProvince').value, document.getElementById('selectedFormat').value, day);
                                }

                                function selectProvince(province) {
                                document.getElementById('selectedProvince').value = province;
                                var buttons = document.querySelectorAll('.cities .province');
                                buttons.forEach(function (btn) {
                                btn.classList.remove('selected');
                                });
                                event.target.classList.add('selected');
                                updateCinemas(province, document.getElementById('selectedFormat').value, document.getElementById('selectedDay').value);
                                }

                                function selectFormat(format) {
                                document.getElementById('selectedFormat').value = format;
                                var links = document.querySelectorAll('.formats a');
                                links.forEach(function (link) {
                                link.classList.remove('selected');
                                });
                                event.target.classList.add('selected');
                                updateCinemas(document.getElementById('selectedProvince').value, format, document.getElementById('selectedDay').value);
                                }

                                function updateCinemas(province, format, day) {
                                var cinemaList = document.getElementById('cinemaList');
                                cinemaList.innerHTML = '';
                                if (cinemas[province] && cinemas[province][day] && cinemas[province][day][format]) {
                                cinemas[province][day][format].forEach(function (cinema) {
                                var cinemaDiv = document.createElement('div');
                                cinemaDiv.classList.add('cinema');
                                var cinemaTitle = document.createElement('h4');
                                cinemaTitle.innerText = cinema.name;
                                cinemaDiv.appendChild(cinemaTitle);
                                var showtimesDiv = document.createElement('div');
                                showtimesDiv.classList.add('showtimes');
                                cinema.showtimes.forEach(function (time) {
                                var button = document.createElement('button');
                                button.innerText = time.split(' ')[0];
                                button.setAttribute('data-theatreID', time.split(' ')[1]);
                                button.onclick = function () {
                                var selectedTime = time.split(' ')[0];
                                var selectedCinema = cinema.name;
                                var theatreID = time.split(' ')[1];
                                document.getElementById('selectedTime').value = selectedTime;
                                document.getElementById('selectedCinema').value = selectedCinema;
                                document.getElementById('theatreID').value = theatreID;
                                alert('Bạn đang chọn suất ' + selectedTime + ' tại rạp ' + selectedCinema);
                                };
                                showtimesDiv.appendChild(button);
                                });
                                cinemaDiv.appendChild(showtimesDiv);
                                cinemaList.appendChild(cinemaDiv);
                                });
                                } else {
                                cinemaList.innerHTML = '<p>No cinemas available for the selected province, day, and format.</p>';
                                }
                                }
        </script>
    </body>
</html>
