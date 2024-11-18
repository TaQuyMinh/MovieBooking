<%-- 
    Document   : Booking
    Created on : Jul 6, 2024, 1:46:31 AM
    Author     : PC
--%>

<%@page import="project.ticket.TicketDTO"%>
<%@page import="java.util.List"%>
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
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Booking</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
              <li class="breadcrumb-item active">Booking</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              
              <!-- /.card-header -->
              <div class="card-body">
                <table id="basicExample" class="table table-bordered table-striped table-hover">
                  <thead>
                  <tr>
                    <th>Ticket ID</th>
                    <th>User ID</th>
                    <th>Seat Number</th>
                    <th>Purchase Date</th>
                    <th>Price</th>
                    <th>Modify</th>
                  </tr>
                  </thead>
                  <tbody>
                      <% 
                      List<TicketDTO> bookingList = (List<TicketDTO>) request.getAttribute("bookingList");
                      if (bookingList != null) {
                        for (TicketDTO ticket : bookingList) {
                    %>
                  <tr>
                    <td><%= ticket.getTicketID() %></td>
                    <td><%= ticket.getUserID() %></td>
                    <td><%= ticket.getSeatName()%></td>
                    <td><%= ticket.getPurchaseDate() %></td>
                    <td><%= ticket.getPrice() %></td>
                    <td> 
                       <a href="DeleteBookingController?id=<%= ticket.getTicketID() %>" class="btn btn-danger btn-custom">Delete</a>
                      <a href="DetailBooking.jsp?id=<%= ticket.getTicketID() %>" class="btn btn-primary btn-custom">Detail</a>
                    </td>
                  </tr>
                  <% 
                        }
                      } else {
                    %>
                    <tr>
                      <td colspan="9">No ticket found.</td>
                    </tr>
                    <% 
                      }
                    %>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="css/../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="css/../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="css/../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="css/../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="css/../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="css/../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- AdminLTE App -->
<script src="css/../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="css/../../dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $("#basicExample").DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
  
</script>

<!-- Data Tables -->
        <script src="css/datatables/dataTables.min.js"></script>
        <script src="css/datatables/dataTables.bootstrap.min.js"></script>

        <!-- Custom Data tables -->
        <script src="css/datatables/custom/custom-datatables.js"></script>
        <script src="css/datatables/custom/fixedHeader.js"></script>
</body>
</html>

