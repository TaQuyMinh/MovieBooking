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
                        <h1>Add New Cinema</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
                            <li class="breadcrumb-item"><a href="CinemaListController">Cinema</a></li>
                            <li class="breadcrumb-item active">Add Cinema</li>
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
                                <h3 class="card-title">Cinema Details</h3>
                            </div>
                            <form role="form" action="AddCinemaController" method="post">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="cinemaID">Cinema ID</label>
                                        <input type="text" class="form-control" id="cinemaID" name="cinemaID" placeholder="Enter Cinema ID" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Cinema Name</label>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter Cinema Name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="location">Cinema Location</label>
                                        <input type="text" class="form-control" id="location" name="location" placeholder="Enter Cinema Location" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="numberOfTheatres">Number of Theatres</label>
                                        <input type="number" class="form-control" id="numberOfTheatres" name="numberOfTheatres" placeholder="Enter Number of Theatres" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="provinceID">Province ID</label>
                                        <input type="number" class="form-control" id="provinceID" name="provinceID" placeholder="Enter Province ID" required>
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

    <aside class="control-sidebar control-sidebar-dark"></aside>
</div>

<script src="css/../../plugins/jquery/jquery.min.js"></script>
<script src="css/../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="css/../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="css/../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="css/../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="css/../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="css/../../dist/js/adminlte.min.js"></script>
<script src="css/../../dist/js/demo.js"></script>
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
