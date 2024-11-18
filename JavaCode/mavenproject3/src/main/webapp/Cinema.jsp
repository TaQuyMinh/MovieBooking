<%@ page import="java.util.List" %>
<%@ page import="project.cinemas.CinemaDTO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="headAdmin.jsp"></jsp:include>
</head>
<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="slidebarAdmin.jsp"></jsp:include>

        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">Cinema</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
                                <li class="breadcrumb-item active">Cinema</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <section class="content">
                <div class="container-fluid">
                    <%
                        String deleteResult = (String) request.getAttribute("deleteResult");
                        if (deleteResult != null) {
                            if (deleteResult.equals("success")) {
                    %>
                        <div style="color: green;">Delete successful!</div>
                    <%
                            } else if (deleteResult.equals("error")) {
                    %>
                        <div style="color: red;">Error occurred during delete!</div>
                    <%
                            }
                        }
                    %>

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h3 class="card-title">List of Cinemas</h3>
                                    <a href="AddCinema.jsp" class="btn btn-primary btn-custom" style="margin-left: 900px;">Add new movie</a>
                                </div>
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Cinema ID</th>
                                                <th>Name</th>
                                                <th>Location</th>
                                                <th>Number of Theatres</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% List<CinemaDTO> cinemaList = (List<CinemaDTO>) request.getAttribute("cinemaList"); %>
                                            <% if (cinemaList != null && !cinemaList.isEmpty()) { %>
                                                <% for (CinemaDTO cinema : cinemaList) { %>
                                                <tr>
                                                    <td><%= cinema.getCinemaID() %></td>
                                                    <td><%= cinema.getName() %></td>
                                                    <td><%= cinema.getLocation() %></td>
                                                    <td><%= cinema.getNumberOfTheatres() %></td>
                                                    <td>
                                                        <a href="UpdateCinemaController?action=UpdateCinema&id=<%= cinema.getCinemaID() %>" class="btn btn-primary btn-custom">Update</a>
                                                        <a href="DeleteCinemaController?id=<%= cinema.getCinemaID() %>" class="btn btn-danger btn-custom">Delete</a>
                                                        <a href="DetailCinema.jsp?id=<%= cinema.getCinemaID() %>" class="btn btn-primary btn-custom">Detail</a>
                                                    </td>
                                                </tr>
                                                <% } %>
                                            <% } else { %>
                                            <tr>
                                                <td colspan="5">No cinemas found.</td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Cinema ID</th>
                                                <th>Name</th>
                                                <th>Location</th>
                                                <th>Number of Theatres</th>
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <aside class="control-sidebar control-sidebar-dark">
        </aside>
    </div>

    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="../../dist/js/adminlte.min.js"></script>
    <script>
        $(function () {
            $("#example1").DataTable({
                "responsive": true,
                "autoWidth": false,
            });
        });
    </script>
</body>
</html>
