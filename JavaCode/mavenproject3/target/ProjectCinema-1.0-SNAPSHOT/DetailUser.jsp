<%@ page import="project.Users.UserDAO" %>
<%@ page import="project.Users.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="headAdmin.jsp"></jsp:include>
</head>
<body class="h-transition sidebar-mini">
<div class="wrapper">
    <jsp:include page="navbar.jsp"></jsp:include>
    <jsp:include page="slidebarAdmin.jsp"></jsp:include>

    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>User Details</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
                            <li class="breadcrumb-item"><a href="UserListController">User</a></li>
                            <li class="breadcrumb-item active">Detail User</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">User Details</h3>
                            </div>
                            <div class="card-body">
                                <% 
                                    String userIdParam = request.getParameter("id");
                                    if (userIdParam != null && !userIdParam.isEmpty()) {
                                        int userId = Integer.parseInt(userIdParam);
                                        UserDAO userDAO = new UserDAO();
                                        UserDTO user = userDAO.getUserByID(userId);
                                        if (user != null) {
                                %>
                                <form role="form">
                                    <div class="form-group">
                                        <label for="UserID">User ID</label>
                                        <textarea class="form-control" id="UserID" rows="1" readonly><%= user.getUserID() %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="Name">Name</label>
                                        <textarea class="form-control" id="Name" rows="1" readonly><%= user.getName() %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="Email">Email</label>
                                        <textarea class="form-control" id="Email" rows="1" readonly><%= user.getEmail() %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="PhoneNumber">Phone Number</label>
                                        <textarea class="form-control" id="PhoneNumber" rows="1" readonly><%= user.getPhoneNumber() %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="Address">Address</label>
                                        <textarea class="form-control" id="Address" rows="1" readonly><%= user.getAddress() %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="Birthday">Birthday</label>
                                        <textarea class="form-control" id="Birthday" rows="1" readonly><%= user.getBirthday() %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="Gender">Gender</label>
                                        <textarea class="form-control" id="Gender" rows="1" readonly><%= user.getGender() %></textarea>
                                    </div>
                                </form>
                                <% 
                                        } else {
                                            out.println("<p>User not found.</p>");
                                        }
                                    } else {
                                        out.println("<p>No user ID specified.</p>");
                                    }
                                %>
                              
                            </div>
                    
                        </div>
                            <div style="display: flex; margin-bottom: 30px; margin-top: 30px;">
                                <div style="margin-left: 30px;"><a href="BookingListController" >Back to Booking List</a></div> 
                            </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

</div>

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
</body>
</html>
