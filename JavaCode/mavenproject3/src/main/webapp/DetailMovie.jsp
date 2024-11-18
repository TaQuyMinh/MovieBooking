<%-- 
    Document   : DetailMovie
    Created on : Jul 8, 2024, 12:19:17 AM
    Author     : PC
--%>

<%@page import="project.movies.MovieDTO"%>
<%@page import="project.movies.MovieDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="headAdmin.jsp"></jsp:include>

        <body class="h-transition sidebar-mini">
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
                                    <h1 >Detail Movie</h1>
                                </div>
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
                                        <li class="breadcrumb-item"><a href="MovieListController">Movie</a></li>
                                        <li class="breadcrumb-item active">Detail Movie</li>
                                    </ol>
                                </div>
                            </div>
                        </div><!-- /.container-fluid -->
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <!-- left column -->
                                <div class="col-md">
                                    <!-- general form elements -->
                                    <div class="card card-primary">
                                        <div class="card-header">
                                            <h3 class="card-title">Movie Details</h3>
                                        </div>

                                    <%
                                        int movieId = 0;
                                        String MovieIdParam = request.getParameter("id");
                                        if (MovieIdParam != null && !MovieIdParam.isEmpty()) {
                                            movieId = Integer.parseInt(MovieIdParam);
                                            MovieDAO dao = new MovieDAO();
                                            MovieDTO movie = dao.getMovieByID(movieId);
                                            if (movie != null) {
                                    %>

                                    <form role="form">
                                        <div class="card-body">

                                            <div class="form-group">
                                                <label for="MovieTitle">Movie ID</label>
                                                <textarea class="form-control" id="MovieID" rows="1" readonly><%= movie.getMovieID()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="MovieTitle">Title</label>
                                                <textarea class="form-control" id="MovieTitle" rows="1" readonly><%= movie.getTitle()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="MoviePoster">Movie Poster</label>
                                                <textarea class="form-control" id="MoviePoster" rows="1" readonly> <%= movie.getPoster()%></textarea> <br>
                                                <img src="<%= movie.getPoster()%>" style="width: 400px; height: 400px;">
                                            </div>
                                            <div class="form-group">
                                                <label for="MovieTrailer"> Trailer</label>
                                                <textarea class="form-control" id="MovieTrailer" rows="1" readonly> <%= movie.getTrailer()%></textarea> <br>
                                                <iframe 
                                                    width="560" height="315" 
                                                    src="<%= movie.getTrailer()%>" 
                                                    title="YouTube video player" 
                                                    frameborder="0" 
                                                    allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                                                    referrerpolicy="strict-origin-when-cross-origin" 
                                                    allowfullscreen>
                                                </iframe>
                                            </div>
                                            <div class="form-group">
                                                <label for="Director"> Duration</label>
                                                <textarea class="form-control" id="Duration" rows="1" readonly><%= movie.getDuration()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="Director"> Rating</label>
                                                <textarea class="form-control" id="Rating" rows="1" readonly> <%= movie.getRating()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="Director"> Director</label>
                                                <textarea class="form-control" id="Director" rows="1" readonly><%= movie.getDirector()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="Actor"> Actor</label>
                                                <textarea class="form-control" id="Actor" rows="1" readonly> <%= movie.getCast()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="ReleaseDate"> Release Date</label>
                                                <textarea class="form-control" id="Actor" rows="1" readonly> <%= movie.getReleaseDate()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="Genre"> Genre</label>
                                                <textarea class="form-control" id="Actor" rows="1" readonly> <%= movie.getGenre()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="Language"> Language</label>
                                                <textarea class="form-control" id="Actor" rows="1" readonly> <%= movie.getCast()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="MovieContent"> Content</label>
                                                <textarea class="form-control" id="MovieContent" rows="3" readonly> <%= movie.getDescription()%></textarea>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->
                                    </form>

                                    <%
                                            } else {
                                                out.println("<p>Movie not found.</p>");
                                            }
                                        } else {
                                            out.println("<p>No Movie ID specified.</p>");
                                        }
                                    %>

                                </div>
                                <!-- /.card -->
                                <div style="display: flex; margin-bottom: 30px; margin-top: 30px;">
                                    <div style="margin-left: 30px;"><a href="MovieListController" >Back to Movie List</a></div> 
                                    <a href="UpdateMovieController?action=UpdateMovie&id=<%= movieId%>"  ><button style="margin-left: 50px; margin-top: -5px;" type="submit" name="action" value="update" class="btn btn-info btn-custom" style="margin-right: 10px; margin-left: 0px;">Update</button></a>  
                                </div>

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
        <!-- DataTables -->
        <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
        <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../../dist/js/demo.js"></script>

    </body>
</html>

