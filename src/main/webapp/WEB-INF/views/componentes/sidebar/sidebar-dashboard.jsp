<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

  <!-- Sidebar - Brand -->
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
    <div class="sidebar-brand-icon">
      <i class="fas fa-laptop-code"></i>
    </div>
    <div class="sidebar-brand-text mx-3">Painel</div>
  </a>

  <!-- Divider -->
  <hr class="sidebar-divider my-0">

  <!-- Nav Item - Dashboard -->
  <li class="nav-item">
    <a class="nav-link" href="${context}/dashboard">
      <i class="fas fa-fw fa-tachometer-alt"></i>
      <span>Dashboard</span></a>
  </li>

  <!-- Divider -->
  <hr class="sidebar-divider">

  <!-- Heading -->
  <div class="sidebar-heading">
    Interface
  </div>

  <c:if test = "${usuario.admin}">   
    <li class="nav-item">
      <a class="nav-link" href="${context}/dashboard/empresas">
        <i class="fas fa-user-tie"></i>
        <span>Clientes</span></a>
    </li>
  </c:if>
  <c:if test = "${usuario.admin}">   
    <li class="nav-item">
      <a class="nav-link" href="${context}/dashboard/projetos">
        <i class="fas fa-project-diagram"></i>
        <span>Projetos</span></a>
    </li>
  </c:if>  
  <li class="nav-item">
    <a class="nav-link" href="${context}/dashboard/campanhas">
      <i class="fas fa-chart-bar"></i>
      <span>Campanhas</span></a>
  </li>

</ul>
<!-- End of Sidebar -->