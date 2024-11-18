<%@ page import="project.cinemas.CinemaDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="headAdmin.jsp"></jsp:include>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <jsp:include page="navbar.jsp"></jsp:include>
    <jsp:include page="slidebarAdmin.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Update Cinema</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
                            <li class="breadcrumb-item"><a href="CinemaListController">Cinema</a></li>
                            <li class="breadcrumb-item active">Update Cinema</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Update Cinema Details</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            
                            <%
                            CinemaDTO cinema = (CinemaDTO) request.getAttribute("cinema");
                            if (cinema != null) {
                            %>
                            <form action="UpdateCinemaController" method="post">
                                <input type="hidden" name="action" value="SaveCinemaEdit">
                                <input type="hidden" name="cinemaID" value="<%= cinema.getCinemaID() %>">

                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="newCinemaName">New Cinema Name</label>
                                        <input type="text" class="form-control" id="newCinemaName" name="newCinemaName" value="<%= cinema.getName() %>" placeholder="Enter New Cinema Name">
                                    </div>
                                    <div class="form-group">
                                        <label for="newCinemaLocation">New Cinema Location</label>
                                        <input type="text" class="form-control" id="newCinemaLocation" name="newCinemaLocation" value="<%= cinema.getLocation() %>" placeholder="Enter New Cinema Location">
                                    </div>
                                    <div class="form-group">
                                        <label for="newNumberOfTheatres">New Number of Theatres</label>
                                        <input type="text" class="form-control" id="newNumberOfTheatres" name="newNumberOfTheatres" value="<%= cinema.getNumberOfTheatres() %>" placeholder="Enter New Number of Theatres">
                                    </div>
                                    <div class="form-group">
                                        <label for="newNumberOfTheatres">New Province ID</label>
                                        <input type="text" class="form-control" id="newProvinceID" name="newProvinceID" value="<%= cinema.getProvinceID() %>" placeholder="Enter New Province ID">
                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <input type="submit" name="action" value="Update Cinema" class="btn btn-primary">
                                </div>
                            </form>
                            <%
                            }
                            %>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
</body>
</html>
