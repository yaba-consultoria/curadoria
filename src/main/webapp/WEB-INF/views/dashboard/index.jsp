<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="pt-br">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Curadoria Yabá Consultoria - Dashboard</title>
  <!-- favicon -->
  <link rel="shortcut icon" href="/images/favicon.png" type="image/x-icon">

  <!-- Custom fonts for this template-->
  <link href="${context}/dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${context}/dashboard/css/sb-admin-2.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-dashboard.jsp" />

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <c:import url="/WEB-INF/views/componentes/topbar/topbar-dashboard.jsp" />
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
          </div>

          <c:if test = "${usuario.admin}">  
            <!-- Content Row -->
            <div class="row">

              <!-- Earnings (Monthly) Card Example -->
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Usuários Cadastrados</div>                        
                          <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <c:choose>
                              <c:when test = "${not empty usuariosLogados}">
                                ${usuariosLogados}
                              </c:when>
                              <c:otherwise>
                                0
                              </c:otherwise>
                            </c:choose>
                          </div>                       
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-signal fa-2x text-gray-300"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Earnings (Monthly) Card Example -->
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Projetos Cadastrados</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          <c:choose>
                            <c:when test = "${not empty projetosCadastrados}">
                              ${projetosCadastrados}
                            </c:when>
                            <c:otherwise>
                              0
                            </c:otherwise>
                          </c:choose>
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-project-diagram fa-2x text-gray-300"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Earnings (Monthly) Card Example -->
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Campanhas Cadastradas</div>
                        <div class="row no-gutters align-items-center">
                          <div class="col-auto">
                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                              <c:choose>
                                <c:when test = "${not empty campanhasCadastradas}">
                                  ${campanhasCadastradas}
                                </c:when>
                                <c:otherwise>
                                  0
                                </c:otherwise>
                              </c:choose> 
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-chart-bar fa-2x text-gray-300"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Pending Requests Card Example -->
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Enquentes Cadastradas</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          <c:choose>
                            <c:when test = "${not empty categoriasCadastradas}">
                              ${categoriasCadastradas}
                            </c:when>
                            <c:otherwise>
                              0
                            </c:otherwise>
                          </c:choose>
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Content Row -->
          </c:if>  

          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-12 mb-4">

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Enquetes em Votação: 
                  <c:if test = "${not empty categoriasAberta.content}"> 
                    </br><small>Exibindo: ${categoriasAberta.content.size()} de ${categoriasAberta.totalElements}</small></h6>
                  </c:if>
                  <c:if test = "${empty categoriasAberta.content}">
                    </br><small>Exibindo: 0 de 0</small></h6>
                  </c:if> 
                </div>
                <div class="card-body">
                  <c:if test = "${empty categoriasAberta.content}"> 
                    <p>Não há enquetes em votação.</p>
                  </c:if>
                  <c:if test = "${not empty categoriasAberta.content}"> 
                    <c:forEach var="categoria" items="${categoriasAberta.content}">
                      <fmt:formatNumber var="porcentagem" value="${(categoria.votos.size() / (totalUsuariosEmpresa * 3) ) * 100}" maxFractionDigits="0"/>
                      <h4 class="small font-weight-bold"><a href="${context}/dashboard/campanhas/${categoria.campanha.id}/categorias/${categoria.id}" class="text-success">${categoria.campanha.nome} - ${categoria.tipo.descricao}</a>
                        <span class="float-right">
                          <c:if test = "${porcentagem ne 'NaN'}">Total de Votos: ${categoria.votos.size()}</c:if> 
                          <c:if test = "${porcentagem eq 'NaN'}">Total de Votos: 0</c:if> 
                        </span>
                      </h4>
                      <div class="progress mb-4">
                        <div class="progress-bar bg-success" role="progressbar" style="width: ${porcentagem}%" aria-valuenow="${porcentagem}%" aria-valuemin="0" aria-valuemax="100" title="${porcentagem}%"></div>
                      </div> 
                    </c:forEach>
                  </c:if>                                   
                </div>
              </div>

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-danger">Enquetes Encerradas: 
                  <c:if test = "${not empty categoriasFechada.content}"> 
                    </br><small>Exibindo: ${categoriasFechada.content.size()} de ${categoriasFechada.totalElements}</small></h6>
                  </c:if>
                  <c:if test = "${empty categoriasFechada.content}">
                    </br><small>Exibindo: 0 de 0</small></h6>
                  </c:if> 
                </div>
                <div class="card-body">
                  <c:if test = "${empty categoriasFechada.content}"> 
                    <p>Não há enquetes em encerradas.</p>
                  </c:if>
                  <c:if test = "${not empty categoriasFechada.content}"> 
                    <c:forEach var="categoria" items="${categoriasFechada.content}">
                      <fmt:formatNumber var="porcentagem" value="${(categoria.votos.size() / (totalUsuariosEmpresa * 3) ) * 100}" maxFractionDigits="0"/>
                      <h4 class="small font-weight-bold"><a href="${context}/dashboard/campanhas/${categoria.campanha.id}/categorias/${categoria.id}/resultados" class="text-danger">${categoria.campanha.nome} - ${categoria.tipo.descricao}</a>
                        <span class="float-right">
                          <c:if test = "${porcentagem ne 'NaN'}">Total de Votos: ${categoria.votos.size()}</c:if> 
                          <c:if test = "${porcentagem eq 'NaN'}">Total de Votos: 0</c:if> 
                        </span>                      
                      </h4>
                      <div class="progress mb-4">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: ${porcentagem}%" aria-valuenow="${porcentagem}%" aria-valuemin="0" aria-valuemax="100" title="${porcentagem}%"></div>
                      </div> 
                    </c:forEach>
                  </c:if>                                   
                </div>
              </div>

            </div>
          
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <c:import url="/WEB-INF/views/componentes/footer/footer-dashboard.jsp"/>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <c:import url="/WEB-INF/views/componentes/modal/modal-logout.jsp" />  

  <!-- Bootstrap core JavaScript-->
  <script src="${context}/dashboard/vendor/jquery/jquery.min.js"></script>
  <script src="${context}/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${context}/dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${context}/dashboard/js/sb-admin-2.min.js"></script>


  
  
</body>

</html>
