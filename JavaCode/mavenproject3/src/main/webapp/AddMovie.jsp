<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="headAdmin.jsp"></jsp:include>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <jsp:include page="navbar.jsp"></jsp:include>
            <jsp:include page="slidebarAdmin.jsp"></jsp:include>

            <div class="content-wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Add New Movie</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
                                    <li class="breadcrumb-item"><a href="MovieListController">Movie</a></li>
                                    <li class="breadcrumb-item active">Add Movie</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Movie Details</h3>
                                    </div>
                                    <form role="form" method="post" action="AddMovieController">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="movieID">Movie ID</label>
                                                <input type="text" class="form-control" id="movieID" name="movieID" placeholder="Enter movie ID">
                                            </div>
                                            <div class="form-group">
                                                <label for="title">Title</label>
                                                <input type="text" class="form-control" id="title" name="title" placeholder="Enter movie title">
                                            </div>
                                            <div class="form-group">
                                                <label for="description">Movie Description</label>
                                                <input type="text" class="form-control" id="description" name="description" placeholder="Enter movie description">
                                            </div>
                                            <div class="form-group">
                                                <label for="releaseDate">Release Date</label>
                                                <input type="date" class="form-control" id="releaseDate" name="releaseDate">
                                            </div>
                                            <div class="form-group">
                                                <label for="duration">Duration</label>
                                                <input type="text" class="form-control" id="duration" name="duration" placeholder="Enter duration">
                                            </div>
                                            <div class="form-group">
                                                <label for="rating">Rating</label>
                                                <input type="text" class="form-control" id="rating" name="rating" placeholder="Enter rating">
                                            </div>
                                            <div class="form-group">
                                                <label for="director">Director</label>
                                                <input type="text" class="form-control" id="director" name="director" placeholder="Enter director name">
                                            </div>
                                            <div class="form-group">
                                                <label for="cast">Cast</label>
                                                <input type="text" class="form-control" id="cast" name="cast" placeholder="Enter cast">
                                            </div>
                                            <div class="form-group">
                                                <label for="genre">Genre</label>
                                                <input type="text" class="form-control" id="genre" name="genre" placeholder="Enter genre">
                                            </div>
                                            <div class="form-group">
                                                <label for="language">Language</label>
                                                <input type="text" class="form-control" id="language" name="language" placeholder="Enter language">
                                            </div>
                                            <div class="form-group">
                                                <label for="poster">Poster</label>
                                                <input type="text" class="form-control" id="poster" name="poster" placeholder="Enter poster URL">
                                            </div>
                                            <div class="form-group">
                                                <label for="trailer">Trailer</label>
                                                <input type="text" class="form-control" id="trailer" name="trailer" placeholder="Enter trailer URL">
                                            </div>
                                            <div class="form-group">
                                                <label for="viewOfMovie">View Of Movie</label>
                                                <input type="text" class="form-control" id="viewOfMovie" name="viewOfMovie" placeholder="Enter view of movie">
                                            </div>
                                            <div class="form-group">
                                                <label for="bannerImage">Banner Image</label>
                                                <input type="text" class="form-control" id="bannerImage" name="bannerImage" placeholder="Enter banner image">
                                            </div>
                                            <div class="form-group">
                                                <label for="bannerStatus">Banner Status</label>
                                                <input type="text" class="form-control" id="bannerStatus" name="bannerStatus" value="True" placeholder="Enter banner status">
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <script src="css/../../plugins/jquery/jquery.min.js"></script>
        <script src="css/../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="css/../../plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="css/../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="css/../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
        <script src="css/../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
        <script src="css/../../dist/js/adminlte.min.js"></script>
        <script src="css/../../dist/js/demo.js"></script>
    </body>
</html>
