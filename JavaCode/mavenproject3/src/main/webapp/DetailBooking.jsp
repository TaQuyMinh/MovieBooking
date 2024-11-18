<%-- 
    Document   : DetailBooking
    Created on : Jul 8, 2024, 12:12:49 AM
    Author     : PC
--%>

<%@page import="project.ticket.TicketDTO"%>
<%@page import="project.ticket.TicketDAO"%>
<%@page import="project.cinemas.CinemaDAO"%>
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
            <h1 >Detail Booking</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
              <li class="breadcrumb-item"><a href="BookingListController">Booking</a></li>
              <li class="breadcrumb-item active">Detail Booking</li>
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
                <h3 class="card-title">Booking Details</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
                    <% 
                    String TicketIdParam = request.getParameter("id");
                    if (TicketIdParam != null && !TicketIdParam.isEmpty()) {
                        int ticketId = Integer.parseInt(TicketIdParam);
                        TicketDAO dao = new TicketDAO();
                        TicketDTO cinema = dao.getTicketById(ticketId);
                        if (cinema != null) {
                %>
              <form role="form">
                <div class="card-body">

                  <div class="form-group">
                    <label for="TicketID">Ticket ID</label>
                    <textarea class="form-control" id="TicketID" rows="1" readonly>Ticket ID</textarea>
                  </div>
                  <div class="form-group">
                    <label for="SeatNumber">Seat Number</label>
                    <textarea class="form-control" id="SeatNumber" rows="1" readonly>Seat Number</textarea>
                  </div>
                  <div class="form-group">
                    <label for="PurchaseDate">Purchase Date</label>
                    <textarea class="form-control" id="PurchaseDate" rows="1" readonly> Purchase Date</textarea>
                  </div>
                  <div class="form-group">
                    <label for="Price"> Price</label>
                    <textarea class="form-control" id="Price" rows="1" readonly> Price</textarea><br>
                  </div>
                  
                </div>
                <!-- /.card-body -->
              </form>
              
              <% 
                    } else {
                        out.println("<p>Ticket not found.</p>");
                    }
                } else {
                    out.println("<p>No Ticket ID specified.</p>");
                }
                %>
                
           
            </div>
            <!-- /.card -->
             <div style="display: flex; margin-bottom: 30px; margin-top: 30px;">
                <div style="margin-left: 30px;"><a href="BookingListController" >Back to Booking List</a></div> 
             </div>
                        
          </div>
          
          <!--/.col (left) -->

         
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
<script src="css../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="css../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="css../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="css../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="css../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="css../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- AdminLTE App -->
<script src="css../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="css../../dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>
</html>

