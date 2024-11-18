<%@page import="project.banners.BannerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.events.EventDTO"%>
<%@page import="java.util.List"%>
<%@page import="project.movies.MovieDTO"%>
<%@page import="project.movies.MovieDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >
    <head>

        <title>HALM</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



        <link
            rel="shortcut icon"
            type="image/png"
            href="images/Black Grey Minimalist Modern Cinema Logo/7.png"
            />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/styleindex.css" />

        <title>Background Animation</title>
        <style>
            body {
                margin: 0;
                height: 100vh;
                background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHKsihcHoQNGI7hfyvCmGA1Eczvm_KduBAnQ&s")
                    no-repeat center center fixed;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <!----------------------------------------------- SLIDES----------------------------------------------------------------------->

        <div class="slideshow-container">
            <%
                List<BannerDTO> bannerList1 = new ArrayList<BannerDTO>();
                List<BannerDTO> bannerList2 = new ArrayList<BannerDTO>();
                List<MovieDTO> movielist = (List<MovieDTO>) request.getAttribute("movieselection");
                if (movielist != null && !movielist.isEmpty()) {
                    for (MovieDTO movie : movielist) {
                        if (movie.getBannerStatus().equals("True")) {
                            BannerDTO banner = new BannerDTO(movie.getBannerImage(), movie.getMovieID());
                            bannerList1.add(banner);
                        }
                    }
                }

                List<EventDTO> eventlist = (List<EventDTO>) request.getAttribute("eventselection");
                if (eventlist != null && !eventlist.isEmpty()) {
                    for (EventDTO event : eventlist) {
                        if (event.getBannerStatus().equals("True")) {
                            BannerDTO banner = new BannerDTO(event.getBannerImage(), event.getEventID());
                            bannerList2.add(banner);
                        }
                    }
                }

                for (BannerDTO banner : bannerList1) {
            %>
            <div class="slide">
                <!----------------------------------------------- Form chuyển trang của phim----------------------------------------------------------------------->
                <form id="movieContentForm_<%= banner.getBannerID()%>" action="moviecontent" method="POST" style="display:none;">
                    <input type="hidden" name="action" value="moviecontent" />
                    <input type="hidden" name="movieID" value="<%= banner.getBannerID()%>" />
                </form>

                <a href="#" onclick="document.getElementById('movieContentForm_<%= banner.getBannerID()%>').submit(); return false;">
                    <img src="<%= banner.getBannerImage()%>" alt="Slide 1" style="width: 1500px; height: 500px" />
                </a>

            </div>
            <%}
            %>

            <%
                for (BannerDTO banner : bannerList2) {


            %>
            <div class="slide">
                <!----------------------------------------------- Form chuyển trang của sự kiện----------------------------------------------------------------------->
                <form id="eventContentForm_<%= banner.getBannerID()%>" action="eventcontent" method="POST" style="display:none;">
                    <input type="hidden" name="action" value="eventcontent" />
                    <input type="hidden" name="eventID" value="<%= banner.getBannerID()%>" />
                </form>

                <a href="#" onclick="document.getElementById('eventContentForm_<%= banner.getBannerID()%>').submit(); return false;">
                    <img src="<%= banner.getBannerImage()%>" alt="Slide 1" style="width: 1500px; height: 500px" />
                </a>

            </div>
            <%}
            %>

            <!----------------------------------------------- nút chuyển tiếp----------------------------------------------------------------------->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>
        <!----------------------------------------------- dot----------------------------------------------------------------------->
        <div class="dot-container">
            <%
                for (int i = 0; i < bannerList1.size() + bannerList2.size(); i++) {
            %>        
            <span class="dot" onclick="currentSlide(<%= i + 1%>)"></span>
            <%}%>
        </div>
        <!-----------------------------------------------FINISH  SLIDES----------------------------------------------------------------------->

        <!------------------------------------------------- FILMS ------------------------------------------------------------------------->

        <div id="movieList">
            <div id="movieListTitle">
                <p>MOVIE SELECTION</p>
            </div>

            <div id ="movies">
                <%
                    if (movielist != null && !movielist.isEmpty()) {
                        for (MovieDTO movie : movielist) {
                %>

                <form id="movieContentForm_<%= movie.getMovieID()%>" action="moviecontent" method="POST" style="display:none;">
                    <input type="hidden" name="action" value="moviecontent" />
                    <input type="hidden" name="movieID" value="<%= movie.getMovieID()%>" />
                </form>

                <a href="#" onclick="document.getElementById('movieContentForm_<%= movie.getMovieID()%>').submit(); return false;">
                    <img src="<%= movie.getPoster()%>" alt="<%= movie.getTitle()%>" />
                </a>


                <%
                    }
                } else {
                %>

                <p>No movies available</p>

                <%}%>
            </div>

            <div id="buttons">
                <button onclick="prevMovies()" class="left-btn">&#10094;</button>
                <button onclick="nextMovies()" class="right-btn">&#10095;</button>
            </div>
        </div>

        <!----------------------------------------------- FINISH FILMS ----------------------------------------------------------------------->

        <!------------------------------------------------- EVENTS ------------------------------------------------------------------------->
        <div id="eventList">
            <div id="eventListTitle">
                <p>EVENT</p>
            </div>

            <div id="events">
                <%

                    if (eventlist != null && !eventlist.isEmpty()) {
                        for (EventDTO event : eventlist) {
                %>
                <form id="eventContentForm_<%= event.getEventID()%>" action="eventcontent" method="POST" style="display:none;">
                    <input type="hidden" name="action" value="eventcontent" />
                    <input type="hidden" name="eventID" value="<%= event.getEventID()%>" />
                </form>

                <a href="#" onclick="document.getElementById('eventContentForm_<%= event.getEventID()%>').submit(); return false;">
                    <img src="<%= event.getPoster()%>" alt="<%= event.getName()%>" />
                </a>

                <%
                    }
                } else {
                %>

                <p>No movies available</p>

                <%}%>
            </div>

            <div id="buttons">
                <button onclick="prevEvents()" class="left-btn-event">&#10094;</button>
                <button onclick="nextEvents()" class="right-btn-event">&#10095;</button>
            </div>
        </div>


        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->
        <jsp:include page="footer.jsp"/>   



        <script src="Script/home.js"></script>
    </body>
</html>

