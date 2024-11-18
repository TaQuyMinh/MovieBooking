<%-- 
    Document   : User
    Created on : Jul 6, 2024, 1:58:38 AM
    Author     : PC
--%>

<%@page import="project.Users.UserDTO"%>
<%@page import="project.Users.UserDTO"%>
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
            <h1>User</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
              <li class="breadcrumb-item active">User</li>
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
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Phone</th>
                      <th>Address</th>
                      <th>Birthday</th>
                      <th>Gender</th>
                      <th>Username</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% 
                      List<UserDTO> userList = (List<UserDTO>) request.getAttribute("userList");
                      if (userList != null) {
                        for (UserDTO user : userList) {
                    %>
                    <tr>
                      <td><%= user.getUserID() %></td>
                      <td><%= user.getName() %></td>
                      <td><%= user.getEmail() %></td>
                      <td><%= user.getPhoneNumber() %></td>
                      <td><%= user.getAddress() %></td>
                      <td><%= user.getBirthday() %></td>
                      <td><%= user.getGender() %></td>
                      <td><%= user.getUsername() %></td>
                      <td>
                        <a href="DetailUser.jsp?id=<%= user.getUserID() %>" class="btn btn-primary btn-custom">Detail</a>
                        <a href="DeleteUserController?id=<%= user.getUserID() %>" class="btn btn-danger btn-custom">Delete</a>
                      </td>
                    </tr>
                    <% 
                        }
                      } else {
                    %>
                    <tr>
                      <td colspan="9">No users found.</td>
                    </tr>
                    <% 
                      }
                    %>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            


</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="css../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="css../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="css/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="css/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="css/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="css/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- AdminLTE App -->
<script src="css./dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="css/dist/js/demo.js"></script>
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

