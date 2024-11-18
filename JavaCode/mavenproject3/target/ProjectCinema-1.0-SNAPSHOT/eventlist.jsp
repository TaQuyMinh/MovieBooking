<%-- 
    Document   : eventlist
    Created on : Jun 22, 2024, 1:35:29 PM
    Author     : HAO
--%>

<%@page import="project.events.EventDTO"%>
<%@page import="project.movies.MovieDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <link
            rel="shortcut icon"
            type="image/png"
            href="images/Black Grey Minimalist Modern Cinema Logo/7.png"
            />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!--Embed CSS here-->
        <link rel="stylesheet" href="css/styleindex.css" />

        <link rel="stylesheet" href="css/eventlist.css"/>



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

        <!-------------------------------Container----------------------------------->
        <div class="eventList">
            <div id="eventListTitle">
                <p>Sự Kiện Và Ưu Đãi</p>
            </div>

            <%
                List<EventDTO> list = (List<EventDTO>) request.getAttribute("eventlist");
                if (list != null) {
                    int numberOfRow = (int) Math.ceil(list.size() / 3.0);
                    int indexOfEvent = 0;
                    for (int k = 1; k <= numberOfRow; k++) {
            %>
            <div class="event-row">
                <% for (int i = 0; i < 3 && indexOfEvent < list.size(); i++, indexOfEvent++) {
                        EventDTO event = list.get(indexOfEvent);
                %>
                <div class="col-md-4-event">

                    <div id="event-description">
                        <form id="eventContentForm_<%= event.getEventID()%>" action="eventcontent" method="POST" style="display:none;">
                            <input type="hidden" name="action" value="eventcontent" />
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>" />
                        </form>

                        <a href="#" onclick="document.getElementById('eventContentForm_<%= event.getEventID()%>').submit();return false;" >
                            <img src="<%= event.getPoster()%>" alt="<%= event.getName()%>" />
                        </a>

                        <p class="event-info"><%= event.getRunningTime()%></p>
                    </div>
                </div>               
                <% } %>
            </div>
            <% }
                } else {
                    out.println("<p>Không có sự kiện nào đang chiếu.</p>");
                }
            %>
        </div>
        <!--END Container-->   
        <jsp:include page="footer.jsp"/>

        <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

        <script src="script.js"></script>
    </body>
</html>
</body>
</html> 
