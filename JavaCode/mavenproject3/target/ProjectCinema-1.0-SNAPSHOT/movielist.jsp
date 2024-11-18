<%-- 
    Document   : phim-dang-chieu
    Created on : Jun 17, 2024, 10:26:09 AM
    Author     : HAO
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="project.movies.MovieDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Phim đang chiếu</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="shortcut icon" type="image/png" href="images/Black Grey Minimalist Modern Cinema Logo/7.png" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <!-- Embed CSS here -->
        <link rel="stylesheet" href="css/movielist.css" />
        <link rel="stylesheet" href="css/styleindex.css" />
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
        <!-- FINISH NAVIGATION -->

        <!-- CONTENT -->

        <div class="filmList">
            <div id="filmListTitle">
                <!----------------------------------------------- tiêu đề----------------------------------------------------------------------->
                <p>Phim đang chiếu</p>

                <!----------------------------------------------- danh sách phim----------------------------------------------------------------------->
            </div>
            <%
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                List<MovieDTO> list = (List<MovieDTO>) request.getAttribute("movielist");
                if (list != null) {
                    int numberOfRow = (int) Math.ceil(list.size() / 3.0);
                    int indexOfMovie = 0;
                    for (int k = 1; k <= numberOfRow; k++) {
            %>
            <div class="film-row">
                <% for (int i = 0; i < 3 && indexOfMovie < list.size(); i++, indexOfMovie++) {
                        MovieDTO movie = list.get(indexOfMovie);
                %>
                <div class="col-md-4-film">
                    <div id="film-description">
                        <!----------------------------------------------- poster phim----------------------------------------------------------------------->
                        <form id="movieContentFormImg_<%= movie.getMovieID()%>" action="moviecontent" method="POST" style="display:none;">
                            <input type="hidden" name="action" value="moviecontent" />
                            <input type="hidden" name="movieID" value="<%= movie.getMovieID()%>" />
                        </form>
                        <a href="#" onclick="document.getElementById('movieContentFormImg_<%= movie.getMovieID()%>').submit(); return false;">
                            <img src="<%= movie.getPoster()%>" alt="<%= movie.getTitle()%>" />
                        </a>


                        <!----------------------------------------------- tên phim----------------------------------------------------------------------->
                        <form id="movieContentFormTitle_<%= movie.getMovieID()%>" action="moviecontent" method="POST" style="display:none;">
                            <input type="hidden" name="action" value="moviecontent" />
                            <input type="hidden" name="movieID" value="<%= movie.getMovieID()%>" />
                        </form>
                        <a href="#" onclick="document.getElementById('movieContentFormTitle_<%= movie.getMovieID()%>').submit(); return false;">
                            <h5 class="film-info"><%= movie.getTitle()%></h5>
                        </a>

                        <!----------------------------------------------- thông tin phim----------------------------------------------------------------------->
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
                        <a class="mua-ve" href="BookingController?action=timebooking&movieID=<%= movie.getMovieID()%>">
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
        </div>
        <!-- FINISH CONTENT -->


        <!-- FOOTER -->

        <jsp:include page="footer.jsp"/>
    </body>
</html>
