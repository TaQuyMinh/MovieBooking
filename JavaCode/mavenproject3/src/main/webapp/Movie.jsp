<%-- 
    Document   : Movie
    Created on : Jul 6, 2024, 1:08:14 AM
    Author     : PC
--%>

<%@page import="project.movies.MovieDTO"%>
<%@page import="java.util.List"%>
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
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Movie</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
              <li class="breadcrumb-item active">Movie</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header d-flex justify-content-between align-items-center">
                <h3 class="card-title">List of Movies</h3>
                <a href="AddMovie.jsp" class="btn btn-primary btn-custom" style="margin-left: 900px;">Add new movie</button></a>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Movie ID</th>
                    <th>Movie Name</th>
                    <th>Poster</th>
                    <th>Trailer</th>
                    <th>Director</th>
                    <th>Actors</th>
                    <th>Content</th>
                    <th>Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                      <% 
                      List<MovieDTO> movieList = (List<MovieDTO>) request.getAttribute("movieList");
                      if (movieList != null) {
                        for (MovieDTO movie : movieList) {
                    %>
                    <tr>
                      <td><%= movie.getMovieID() %></td>
                      <td><%= movie.getTitle() %></td>
                      <td>
                        <!-- Image that opens modal when clicked -->
                        <img src="<%= movie.getPoster() %>"
                             class="img-fluid img-thumbnail"
                             style="width: 100px; height: 100px;"
                             alt="Theatre Image"
                             data-src="<%= movie.getPoster() %>"
                             onclick="openImageModal(this)">
                    </td>
                      <td><a href="<%= movie.getTrailer() %>" data-toggle="modal" data-target="#videoModal1" data-url="<%= movie.getTrailer() %>">Watch Trailer</a></td>
                      <td><%= movie.getDirector() %></td>
                      <td><%= movie.getCast() %></td>
                      <td> <a href="DetailMovie.jsp?id=<%= movie.getMovieID() %>" id="content-quote" data-toggle="modal" data-target="#detailModal1">Detail</a></td>
                      <td>
                        <a href="UpdateMovieController?action=UpdateMovie&id=<%= movie.getMovieID() %>" class="btn btn-primary btn-custom">Update</a>
                        <a href="DeleteMovieController?id=<%= movie.getMovieID() %>" class="btn btn-danger btn-custom">Delete</a>
                        <a href="DetailMovie.jsp?id=<%= movie.getMovieID() %>" class="btn btn-primary btn-custom">Detail</a>
                      </td>
                    </tr>
                    <% 
                        }
                      } else {
                    %>
                    <tr>
                      <td colspan="9">No movies found.</td>
                    </tr>
                    <% 
                      }
                    %>
                  <!-- Additional rows as needed -->
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Movie ID</th>
                    <th>Movie Name</th>
                    <th>Poster</th>
                    <th>Trailer</th>
                    <th>Director</th>
                    <th>Actors</th>
                    <th>Content</th>
                    <th>Actions</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->


<!-- Modal Structure for Detail -->
<div class="modal fade" id="detailModal1" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel1" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detailModalLabel1">Movie Detail</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Thêm nội dung chi tiết của hàng tại đây -->
        <p>Đây là nội dung chi tiết của bộ phim.</p>
        <p>Cuộc sống tuổi mới lớn của cô bé Riley lại tiếp tục trở nên hỗn loạn hơn bao giờ hết với sự xuất hiện của 4 cảm xúc hoàn toàn mới: Lo u, Ganh Tị, Xấu Hổ, Chán Nản. Mọi chuyện thậm chí còn rối rắm hơn khi nhóm cảm xúc mới này nổi loạn và nhốt nhóm cảm xúc cũ gồm Vui Vẻ, Buồn Bã, Giận Dữ, Sợ Hãi và Chán Ghét lại, khiến cô bé Riley rơi vào những tình huống dở khóc dở cười.
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
      </div>
    </div>
  </div>
</div>



<!-- Modal Structure for Video -->
<div class="modal fade" id="videoModal1" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel1" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="videoModalLabel1">Trailer Video</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Embed YouTube video -->
        <div class="embed-responsive embed-responsive-16by9">
          <iframe id="videoTrailer" class="embed-responsive-item" src="" allowfullscreen allow="autoplay; encrypted-media"></iframe>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal Structure for Viewing Larger Image -->
<div class="modal fade" id="imageModal1" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel1" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="imageModalLabel1">Theatre Image</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <img id="imgModal1" src="" class="img-fluid" alt="Poster Image">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



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
<!-- Page script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
  });

  // Handle form submission for adding a new theatre
  $('#addTheatreForm').on('submit', function(event) {
    event.preventDefault();
    // Get form data
    var formData = new FormData(this);
    // Process form data (e.g., send to server, update table, etc.)
    console.log('Form data:', formData);
    // Close modal
    $('#addTheatreModal').modal('hide');
  });

 
  //Cắt link video
  function getYouTubeVideoId(url) {
    // Regular expression to extract video ID from various YouTube URL formats
    var regExp = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*/;
    var match = url.match(regExp);

    if (match && match[1].length === 11) {
      return match[1]; // Return the video ID extracted from the URL
    } else {
      console.error('Invalid YouTube URL');
      return null;
    }
  }

  $(document).ready(function() {
    // When the modal is shown
    $('#videoModal1').on('show.bs.modal', function(event) {
      var button = $(event.relatedTarget); // Button that triggered the modal
      var url = button.data('url'); // Extract video URL from data-url attribute
      var videoId = getYouTubeVideoId(url); // Extract video ID from YouTube URL

      if (videoId) {
        // If valid video ID, update iframe src with the YouTube embed URL
        $('#videoTrailer').attr('src', 'https://www.youtube.com/embed/' + videoId + '?rel=0&autoplay=0'); // Ensure autoplay is disabled
      } else {
        console.error('Failed to get YouTube video ID');
      }
    });

    // When the modal is hidden
    $('#videoModal1').on('hidden.bs.modal', function() {
      // Clear the iframe src to stop video playback
      $('#videoTrailer').attr('src', '');
    });
  });


// When the modal is closed
$('#videoModal1').on('hidden.bs.modal', function() {
  // Stop the video by setting the src attribute to an empty string
  $('#videoTrailer').attr('src', '');
});

//imagine

function openImageModal(imgElement) {
    var imgUrl = $(imgElement).data('src'); // Extract image URL from data-src attribute

    // Update the modal image src with the selected image URL
    $('#imgModal1').attr('src', imgUrl);

    // Show the modal
    $('#imageModal1').modal('show');
  }

  $(document).ready(function() {
    // When the modal is hidden
    $('#imageModal1').on('hidden.bs.modal', function() {
      // Clear the modal image src
      $('#imgModal1').attr('src', '');
    });
  });




</script>

</body>
</html>

