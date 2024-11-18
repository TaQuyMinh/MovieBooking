<%-- 
    Document   : eventcontent
    Created on : Jun 22, 2024, 4:46:41 PM
    Author     : HAO
--%>

<%@page import="project.events.EventDTO"%>
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
        <link rel="stylesheet" href="css/eventcontent.css"/>
        <link rel="stylesheet" href="css/styleindex.css"/>

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
        
        <!----------------------------------------------- FINISH NAVIGATION----------------------------------------------------------------------->
        <!------------------------------Content---------------------------------->
        <%
            EventDTO event = (EventDTO) request.getAttribute("event");
            if (event != null) {
        %>

        <div class="eventList">
            <div id="eventListTitle">
                <p>Sự Kiện Và Ưu Đãi</p>
            </div>

            <div class="event-title-row">
                <h3 style="margin-top: 20px 20px;"><%=event.getName()%></h3>
                <div class="container-fluid">
                    <div class="col-md-6" id="poster">
                        <img src="<%=event.getPoster()%>" alt="<%=event.getName()%>">
                    </div>
                    <div class="col-md-6" id="content">
                        <p><strong>1. Nội dung chương trình:</strong></p>
                        <p><%=event.getContent()%></p>
                        <p><strong>2. Thời gian:</strong><%=event.getRunningTime()%></p>
                        <p><strong>3. Điều kiện và điều khoản chương trình:</strong></p>
                        <div id ="condition" style="white-space: pre-wrap;"><%=event.getCondition()%></div>                     
                    </div>
                </div>
            </div> 
        </div>
            <%
            } else {
            %>
            <p>Không tìm thấy thông tin về sự kiện này.</p>
      
            <%
                }  
            %>
       
            <!------------------FINISH CONTENT-------------------------->  
            <!----------------------------------------------- FOOTER ----------------------------------------------------------------------->
            <jsp:include page="footer.jsp"/>


            <!----------------------------------------------- FINISH FOOTER ----------------------------------------------------------------------->

            <script src="Script/home.js"></script>
    </body>
</html>

