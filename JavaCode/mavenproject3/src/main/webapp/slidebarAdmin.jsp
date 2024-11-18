<%-- 
    Document   : slidebarAdmin
    Created on : Jul 8, 2024, 1:15:10 AM
    Author     : PC
--%>

<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="home" class="brand-link">
    <span class="brand-text font-weight-light" style="margin-left: 20px; font-weight: 100px; font-size: 30px">HALM CINEMA </span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <%
            session = request.getSession();
            String ten = (String) session.getAttribute("name");
        %>
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
