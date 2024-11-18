<%@page import="project.movies.MovieDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="headAdmin.jsp"></jsp:include>
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
            <h1>Update Movie</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
              <li class="breadcrumb-item"><a href="MovieListController">Movie</a></li>
              <li class="breadcrumb-item active">Update Movie</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">

          <div class="col-md">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">New Movie Details</h3>
              </div>

              <%
                MovieDTO movie = (MovieDTO) request.getAttribute("movie");
                if (movie != null) {
              %>
              <form method="post" action="UpdateMovieController">
                    <input type="hidden" name="movieID" value="<%= movie.getMovieID() %>">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="title">New Title</label>
                                <input type="text" class="form-control" id="title" name="title" value="<%= movie.getTitle() %>" placeholder="Enter movie title">
                            </div>
                            <div class="form-group">
                                <label for="description">New Movie Description</label>
                                <input type="text" class="form-control" id="description" name="description" value="<%= movie.getDescription() %>" placeholder="Enter movie description">
                            </div>
                            <div class="form-group">
                                <label for="releaseDate">New Release Date</label>
                                <input type="date" class="form-control" id="releaseDate" name="releaseDate" value="<%= movie.getReleaseDate() %>">
                            </div>
                            <div class="form-group">
                                <label for="duration">New Duration</label>
                                <input type="text" class="form-control" id="duration" name="duration" value="<%= movie.getDuration() %>">
                            </div>
                            <div class="form-group">
                                <label for="rating">New Rating</label>
                                <input type="text" class="form-control" id="rating" name="rating" value="<%= movie.getRating() %>" placeholder="Enter rating">
                            </div>
                            <div class="form-group">
                                <label for="director">New Director</label>
                                <input type="text" class="form-control" id="director" name="director" value="<%= movie.getDirector() %>" placeholder="Enter director name">
                            </div>
                            <div class="form-group">
                                <label for="cast">New Cast</label>
                                <input type="text" class="form-control" id="cast" name="cast" value="<%= movie.getCast() %>" placeholder="Enter cast">
                            </div>
                            <div class="form-group">
                                <label for="genre">New Genre</label>
                                <input type="text" class="form-control" id="genre" name="genre" value="<%= movie.getGenre() %>" placeholder="Enter genre">
                            </div>
                            <div class="form-group">
                                <label for="language">New Language</label>
                                <input type="text" class="form-control" id="language" name="language" value="<%= movie.getLanguage() %>" placeholder="Enter language">
                            </div>
                            <div class="form-group">
                                <label for="poster">New Poster</label>
                                <input type="text" class="form-control" id="poster" name="poster" value="<%= movie.getPoster() %>" placeholder="Enter poster URL">
                            </div>
                            <div class="form-group">
                                <label for="trailer">New Trailer</label>
                                <input type="text" class="form-control" id="trailer" name="trailer" value="<%= movie.getTrailer() %>" placeholder="Enter trailer URL">
                            </div>
                            <div class="form-group">
                                <label for="viewOfMovie">New View Of Movie</label>
                                <input type="text" class="form-control" id="viewOfMovie" name="viewOfMovie" value="<%= movie.getViewOfMovie() %>" placeholder="Enter view of movie">
                            </div>
                            <div class="form-group">
                                <label for="bannerImage">Banner Image</label>
                                <input type="text" class="form-control" id="bannerImage" name="bannerImage" value="<%= movie.getBannerImage() %>" placeholder="Enter banner image">
                            </div>
                            <div class="form-group">
                                <label for="bannerStatus">Banner Image</label>
                                <input type="text" class="form-control" id="bannerStatus" name="bannerStatus" value="<%= movie.getBannerStatus() %>" placeholder="Enter banner status">
                            </div>
                        </div>
                        <div class="card-footer">
                            <input type="hidden" name="action" value="SaveMovieUpdate">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
              <% } else { %>
                  <p>No movie found.</p>
              <% } %>
            </div>
            <!-- /.card -->

          </div>
          <!--/.col (right) -->
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
<script src="../../dist/js/demo.js
