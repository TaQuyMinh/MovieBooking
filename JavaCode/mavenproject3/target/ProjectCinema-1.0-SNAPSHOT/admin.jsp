<!DOCTYPE html>
<html>
    <jsp:include page="headAdmin.jsp"></jsp:include>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
          <a href="DashboardController" class="nav-link">Home</a>
      </li>
    </ul>



    <!-- Right navbar links -->
    <a href="login?action=logout" style="margin-left: 1000px">Log Out</a>
    

  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="home" class="brand-link">
        <span class="brand-text font-weight-light" style="margin-left: 20px; font-weight: 100px; font-size: 30px">HALM CINEMA </span>
    </a>
    
    <%
        session = request.getSession();
        String ten = (String) session.getAttribute("name");
    %>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        
        <div class="info">
            <h3 class="d-block" style="color: white; margin-left: 60px"><%= ten%></h3>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               <li class="nav-item">
                   <a href="DashboardController" class="nav-link">
                  <i class="nav-icon ion-ios-home fa-th"></i>
                  <p>
                    Dashboard
                  </p>
                </a>
              </li>
          <li class="nav-item">
            <a href="MovieListController" class="nav-link">
              <i class="nav-icon ion-compose fa-th"></i>
              <p>
                Movie
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="CinemaListController" class="nav-link">
              <i class="nav-icon ion-compose fa-th"></i>
              <p>
                Cinema
              </p>
            </a>
          </li>

          <li class="nav-item">
            <a href="UserListController" class="nav-link">
              <i class="nav-icon ion-compose fa-th"></i>
              <p>
                User
              </p>
            </a>
          </li>

          <li class="nav-item">
            <a href="BookingListController" class="nav-link">
              <i class="nav-icon ion-compose fa-th"></i>
              <p>
                Booking
              </p>
            </a>
          </li>

        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <%
                    Integer userCount = (Integer) request.getAttribute("userCount");
                    if (userCount == null) {
                        userCount = 0;
                    }
                %>
                <h3><%= userCount %></h3>

                <p>User</p>
              </div>
              <div class="icon">
                <i class="ion ion-android-person"></i>
              </div>
              <a href="UserListController" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <%
                    Integer cinemaCount = (Integer) request.getAttribute("cinemaCount");
                    if (cinemaCount == null) {
                        cinemaCount = 0;
                    }
                %>
                <h3><%= cinemaCount %></h3>


                <p>Cinema</p>
              </div>
              <div class="icon">
                <i class="ion ion-ios-monitor"></i>
              </div>
              <a href="CinemaListController" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <%
                    Integer movieCount = (Integer) request.getAttribute("movieCount");
                    if (movieCount == null) {
                        movieCount = 0;
                    }
                %>
                <h3><%= movieCount %></h3>

                <p>Movie</p>
              </div>
              <div class="icon">
                <i class="ion ion-ios-film-outline"></i>
              </div>
              <a href="MovieListController" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <%
                Integer booingCount = (Integer) request.getAttribute("bookingCount");
                if (booingCount == null) {
                    booingCount = 0;
                }
                %>
                <h3><%= booingCount %></h3>

                <p>Booking</p>
              </div>
              <div class="icon">
                <i class="ion ion-pricetag"></i>
              </div>
              <a href="BookingListController" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->
        

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="css/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="css/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="css/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="css/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="css/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="css/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="css/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="css/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="css/plugins/moment/moment.min.js"></script>
<script src="css/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="css/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="css/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="css/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="css/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="css/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="css/dist/js/demo.js"></script>
</body>
</html>
