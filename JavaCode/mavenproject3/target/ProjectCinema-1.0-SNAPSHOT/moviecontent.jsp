<%-- 
    Document   : phim-dien-anh-Doraemon
    Created on : Jun 17, 2024, 10:34:25 AM
    Author     : HAO
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="project.movies.MovieDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Phim đang chiếu</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/moviecontent.css">
        <link rel="stylesheet" href="css/styleindex.css" />

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
        <!----------------------------------------------- FINISH NAVIGATION-------------------------------------------------->

        <!----------------------------------------------- CONTENT-------------------------------------------------->
        <%
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            MovieDTO movie = (MovieDTO) request.getAttribute("movie");
            if (movie != null) {
        %>

        <div class="filmContent">
            <div id="filmContentTitle">
                <p>Nội dung phim</p>
            </div>

            <!----------------------------------------------- Poster và Tên phim----------------------------------------------------------------------->
            <div class="col-md-4" id="filmPoster">
                <img src="<%=movie.getPoster()%>"
                     alt="<%=movie.getTitle()%>" >

                <div class="inline-block">
                    <span class="luot-xem">
                        <p>
                            Lượt xem: <%= movie.getViewOfMovie()%>
                        </p>
                    </span>
                    <a class="mua-ve" href="BookingController?action=timebooking&movieID=<%= movie.getMovieID()%>">
                        <p>Mua vé</p>
                    </a>
                </div>
            </div>

            <div id="filmInformation">
                <div id="filmName">
                    <p><%=movie.getTitle()%></p>
                </div>
                <!----------------------------------------------- Thông tin phim----------------------------------------------------------------------->
                <div id="filmDetail">
                    <ul>
                        <li>Đạo diễn: <%=movie.getDirector()%> </li>
                        <li>Diễn viên: <%=movie.getCast()%></li>
                        <li>Thể loại: <%=movie.getGenre()%></li>
                        <li>Khởi chiếu: <%= dateFormat.format(movie.getReleaseDate())%></li>
                        <li>Thời lượng: <%=movie.getDuration()%> phút</li>
                        <li>Ngôn ngữ: <%= movie.getLanguage()%></li>
                    </ul>
                </div>
            </div>

            <!----------------------------------------------- Tóm tắt nôi dung phim ----------------------------------------------------------------------->
            <div id="filmIntroduction">
                <div id="introductionTitle">
                    <p>Giới thiệu</p>
                </div>

                <div id="introductionContent">
                    <p>
                        <%=movie.getDescription()%>
                    </p>
                </div>
            </div>

            <!----------------------------------------------- Trailer ----------------------------------------------------------------------->
            <div id="trailer">
                <div id="trailerTitle">
                    <p>Trailer</p>
                </div>

                <div id="trailerVideo">
                    <iframe width="917" height="516" src="<%= movie.getTrailer()%>"
                            title="<%= movie.getTitle()%>"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

                </div>

            </div>
        </div>

        <%
        } else {
        %>
        <p>Không tìm thấy thông tin về bộ phim này.</p>
        <%
            }
        %>

        <!----------------------------------------------- FINISH CONTENT-------------------------------------------------->


        <!----------------------------------------------- FOOTER ------------------------------------------------------------>
        <jsp:include page="footer.jsp"/>

    </body>



</html>
