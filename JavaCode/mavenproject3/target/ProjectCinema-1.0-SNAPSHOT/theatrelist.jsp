<%-- 
    Document   : theatrelist
    Created on : Jun 25, 2024, 4:23:00 PM
    Author     : HAO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="project.movies.MovieDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="project.cinemas.CinemaDTO"%>
<%@page import="project.provinces.ProvinceDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>HALM Cinema</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
        <script src="main.js"></script>
        <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/theatre.css" />
        <link rel="stylesheet" href="css/movielist.css" />
        <link rel="stylesheet" href="css/styleindex.css" />


        <title>Background Animation</title>
        <style>
            body {
                margin: 0;
                height: 100vh;
                background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHKsihcHoQNGI7hfyvCmGA1Eczvm_KduBAnQ&s") no-repeat center center fixed;
                background-size: cover;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <!-----------------------Theatre-List------------------------------------->

        <div class="theatre-list">
            <div class="title-cinema">
                <h1>HALM CINEMA</h1>
            </div>
            <div class="cinemas-area">
                <ul>
                    <!----------------------------------------------- Hiển thị danh sách các tỉnh----------------------------------------------------------------------->
                    <%
                        List<ProvinceDTO> list = (List<ProvinceDTO>) request.getAttribute("provincelist");
                        if (list != null) {
                            for (ProvinceDTO province : list) {
                    %>
                    <li>
                        <a href="cinemalist?action=cinema&provinceID=<%= province.getProvinceID()%>" class="province" data-id="HALM_<%= province.getProvinceID()%>"><%= province.getName()%></a>
                    </li>
                    <%
                        }
                    } else {
                    %>
                    <li>No province available</li>
                        <%
                            }
                        %>
                </ul>
            </div>
            <!----------------------------------------------- Hiển thị danh sách các rạp của các tỉnh ----------------------------------------------------------------------->
            <%
                if (list != null) {
                    for (ProvinceDTO province : list) {
                        List<CinemaDTO> cinemalist = (List<CinemaDTO>) request.getAttribute("cinemalist" + province.getProvinceID());
            %>
            <div class="cinemas-list hidden" id="HALM_<%= province.getProvinceID()%>">
                <ul>
                    <%
                        if (cinemalist != null) {
                            for (CinemaDTO cinema : cinemalist) {
                    %>
                    <li class="cinemass" film-id="cinema<%= cinema.getName()%>"><a href="#"><%= cinema.getName()%></a></li>
                        <%
                            }
                        } else {
                        %>
                    <li>No cinema available</li>
                        <%
                            }
                        %>
                </ul>
            </div>
                <!----------------------------------------------- Hiển thị địa chỉ của rạp đã chọn----------------------------------------------------------------------->
            <%
                for (CinemaDTO cinema : cinemalist) {
            %>
            <div class="filmList hidden" id="cinema<%= cinema.getName()%>">
                <p>Địa chỉ: <%= cinema.getLocation()%></p>
            </div>
            <%
                }
            %>
            <%
                    }
                }
            %>
        </div>

        <!-----------------------Finish Theatre-List------------------------------------->




        <!-----------------------CONTENT------------------------------------->   

        <!--        <div class="filmList hidden" id="cinema1">
                    <div id="filmListTitle">
                        <p>Phim đang chiếu</p>
                    </div>
        <%
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            List<MovieDTO> movielist = (List<MovieDTO>) request.getAttribute("movielist");
            if (movielist != null) {
                int numberOfRow = (int) Math.ceil(movielist.size() / 3.0);
                int indexOfMovie = 0;
                for (int k = 1; k <= numberOfRow; k++) {
        %>
        <div class="film-row">
        <% for (int i = 0; i < 3 && indexOfMovie < movielist.size(); i++, indexOfMovie++) {
                MovieDTO movie = movielist.get(indexOfMovie);
        %>
        <div class="col-md-4-film">
            <div id="film-description">
                <a href="moviecontent?action=moviecontent&movieID=<%= movie.getMovieID()%>" method="GET">
                    <img src="<%= movie.getPoster()%>" alt="<%= movie.getTitle()%>" />
                </a>


                <a href="moviecontent?action=moviecontent&movieID=<%= movie.getMovieID()%>" method="GET">
                    <h5 class="film-info"><%= movie.getTitle()%></h5>
                </a>
                <p class="film-info">Thể loại: <%= movie.getGenre()%></p>
                <p class="film-info">Thời lượng: <%= movie.getDuration()%> phút</p>
                <p class="film-info">Khởi chiếu: <%= dateFormat.format(movie.getReleaseDate())%></p>
            </div>
            <div class="inline-block">
                <span class="luot-xem">
                    <p>
                        Lượt xem: <%= movie.getViewOfMovie()%>
                    </p>
                </span>
                <a class="mua-ve" href="">
                    <p>Mua vé</p>
                </a>
            </div>
        </div>
        <% } %>
    </div>
        <% }
            } else {
                out.println("<p>Không có phim nào đang chiếu.</p>");
            }
        %>
    </div>-->




        <!----------------------------------------------- FINISH CONTENT----------------------------------------------------------------------->

        <!----------------------------------------------- FOOTER ----------------------------------------------------------------------->


        <jsp:include page="footer.jsp"/>


        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

        <script src="Script/theatre.js"></script>
    </body>

</html>
