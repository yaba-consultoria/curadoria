<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<li class="nav-item dropdown no-arrow mx-1">
  <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <i class="fas fa-bell fa-fw text-danger"></i>
    <!-- Counter - Alerts -->
    <span class="badge badge-danger badge-counter"><i class="fas fa-exclamation"></i></span>
  </a>
  <!-- Dropdown - Alerts -->
  <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
    <h6 class="dropdown-header">
      Central de Alertas
    </h6>
    <a class="dropdown-item d-flex align-items-center" href="#">
      <div class="mr-3">
        <div class="icon-circle bg-danger">
          <i class="fas fa-file-alt text-white"></i>
        </div>
      </div>
      <div>        
        <span class="font-weight-bold">${alertCenter}</span>
      </div>
    </a>
  </div>
</li>