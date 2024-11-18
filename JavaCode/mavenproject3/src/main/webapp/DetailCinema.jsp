<%@page import="project.cinemas.CinemaDAO"%>
<%@page import="project.cinemas.CinemaDTO"%>
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
            <h1>Cinema Details</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="DashboardController">Home</a></li>
              <li class="breadcrumb-item"><a href="CinemaListController">Cinema</a></li>
              <li class="breadcrumb-item active">Cinema Details</li>
            </ol>
          </div>
        </div>
      </div>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Cinema Details</h3>
              </div>
                
                <% 
                    int cinemaId = 0;
                    String CinemaIdParam = request.getParameter("id");
                    if (CinemaIdParam != null && !CinemaIdParam.isEmpty()) {
                        cinemaId = Integer.parseInt(CinemaIdParam);
                        CinemaDAO dao = new CinemaDAO();
                        CinemaDTO cinema = dao.getCinemaById(cinemaId);
                        if (cinema != null) {
                %>
                
              <form role="form">
                <div class="card-body">
                  <div class="form-group">
                    <label for="idCinema">ID Cinema</label>
                    <textarea class="form-control" id="idCinema" rows="1" readonly><%= cinema.getCinemaID() %></textarea>
                  </div>
                  <div class="form-group">
                    <label for="cinemaName">Cinema Name</label>
                    <textarea class="form-control" id="cinemaName" rows="1" readonly><%= cinema.getName() %></textarea>
                  </div>
                  <div class="form-group">
                    <label for="location">Location</label>
                    <textarea class="form-control" id="location" rows="1" readonly><%= cinema.getLocation() %></textarea>
                  </div>
                  <div class="form-group">
                    <label for="numberOfTheatres">Number of Theatres</label>
                    <textarea class="form-control" id="numberOfTheatres" rows="1" readonly><%= cinema.getNumberOfTheatres() %></textarea>
                  </div>
                </div>
              </form>
                  <% 
                    } else {
                        out.println("<p>Cinema not found.</p>");
                    }
                } else {
                    out.println("<p>No Cinema ID specified.</p>");
                }
                %>
                
            </div>
                
                <div style="display: flex; margin-bottom: 30px; margin-top: 30px;">
                    <div style="margin-left: 30px;"><a href="CinemaListController" >Back to Cinema List</a></div> 
                    <a href="UpdateCinemaController?action=UpdateCinema&id=<%= cinemaId%>"  ><button style="margin-left: 50px; margin-top: -5px;" type="submit" name="action" value="update" class="btn btn-info btn-custom" style="margin-right: 10px; margin-left: 0px;">Update</button></a>  
                </div>
                
          </div>
        </div>
      </div>
    </section>
  </div>
</div>
</body>
</html>
