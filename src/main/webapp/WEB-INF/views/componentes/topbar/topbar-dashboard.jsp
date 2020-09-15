<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

  <!-- Sidebar Toggle (Topbar) -->
  <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
    <i class="fa fa-bars"></i>    
  </button>  

  <!-- Topbar Navbar -->
  <ul class="navbar-nav ml-auto">

    <!-- Central de Alertas -->
    <c:if test = "${not empty alertCenter}"> 
      <c:import url="/WEB-INF/views/componentes/alert/alert-center.jsp" />
    </c:if>

    <div class="topbar-divider d-none d-sm-block"></div>

    <!-- Nav Item - User Information -->
    <li class="nav-item dropdown no-arrow">
      <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="mr-2 d-none d-lg-inline text-gray-600">${usuario.nome}</span>
        <i class="fas fa-user-circle fa-2x"></i>
      </a>
      <!-- Dropdown - User Information -->
      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown"> 
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-logout">
          <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
          Logout
        </a>
      </div>
    </li>

  </ul>

</nav>
<!-- End of Topbar -->

<c:import url="/WEB-INF/views/componentes/modal/modal-logout.jsp" />
<!-- End of Topbar -->