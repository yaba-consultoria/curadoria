<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Curadoria Yabá Consultoria - Projetos</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="${context}/images/favicon.png" type="image/x-icon">

    <!-- Fontawesome -->
    <link href="${context}/dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${context}/dashboard/css/sb-admin-2.css" rel="stylesheet">
    <link href="${context}/dashboard/css/rating.css" rel="stylesheet">
    <!-- Data Tables -->
    <link href="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- Bootstrap TagInput -->
    <link href="${context}/dashboard/vendor/bootstrap-taginput/css/bootstrap-tagsinput.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Import Sidebar -->
    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-dashboard.jsp" />
    <!-- End Import Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Import Topbar -->
            <c:import url="/WEB-INF/views/componentes/topbar/topbar-dashboard.jsp" />
            <!-- End Import Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">                

                <div class="d-flex flex-row justify-content-between">
                  <!-- Page Heading -->
                  <h1 class="h3 mb-2 text-gray-800">
                    <a href="${context}/dashboard/projetos">Projetos</a>
                  </h1> 
                  <!-- Botão Nova Empresa -->
                  <button class="btn btn-primary" data-toggle="modal" data-target="#modal-cadastro-projeto">Novo Projeto</button>
                </div>                

                <!-- Lista de Projetos -->                                   
                <div class="card shadow mb-4 mt-4">

                  <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Lista de Projetos
                      <br><small>Exibindo: ${projetos.content.size()} de ${projetos.totalElements}</small></h6>
                  </div>

                  <div class="card-body">
                       <!-- Alert Sem Registros -->
                      <c:if test = "${empty projetos.content}"> 
                          <div class="alert alert-danger my-4" role="alert">
                            <h4 class="alert-heading">Sem Registros</h4>
                            <p>Não há registros de projetos no servidor.</p>
                          </div>
                      </c:if>

                      <!-- Alert Default -->
                      <div class="row">
                        <div class="col-12">
                          <c:import url="/WEB-INF/views/componentes/alert/alert-default.jsp" />
                        </div>
                      </div>

                      <c:if test = "${not empty projetos.content}">   
                        <div class="row mt-3">
                            <div class="col-12 d-flex justify-content-start">
                              <form action="${context}/dashboard/projetos" class="d-inline-block form-inline mr-5 mw-100 navbar-search" method="get">
                                <div class="input-group">
                                  <input type="text" class="form-control small" name="titulo" placeholder="Pesquisar por título ..." aria-label="Search" aria-describedby="basic-addon2">
                                  <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                      <i class="fas fa-search fa-sm"></i>
                                    </button>
                                  </div>
                                </div>
                              </form>                                 
                              <!-- Import Topbar -->
                              <c:import url="/WEB-INF/views/componentes/pagination/pagination-listar-projetos.jsp" />
                              <!-- End Import Topbar -->
                            </div>
                        </div>               
                        <div class="row">
                          <c:forEach var="projeto" items="${projetos.content}">
                              <div class="card-deck col-md-12 col-lg-6 col-xl-4 mt-4">                                      
                                <div class="card">
                                  <img src="${context}/${projeto.logo.caminhoRelativo}" class="card-img-top" alt="logo" style="max-height: 260px;">
                                  <div class="card-body">
                                    <h6 class="card-title font-weight-bold" style="font-size: 1.2rem;">                                              
                                      <div class="row">  
                                        <div class=" col-12 my-2">
                                            <i class="fas fa-edit"></i> 
                                              <c:choose> 
                                                <c:when test = "${fn:length(projeto.titulo) > 40}"> ${fn:substring(projeto.titulo, 0, 40)} ... </c:when>
                                                <c:otherwise> ${projeto.titulo}</c:otherwise>
                                              </c:choose>                                                          
                                        </div>
                                      </div>
                                      <div class="row">  
                                        <div class=" col-12 my-2">
                                            <i class="fas fa-user-tie"></i> ${projeto.proponente}                                                           
                                        </div>
                                      </div>
                                      <div class="row">  
                                        <div class=" col-12 my-2">
                                            <i class="fas fa-map-marker-alt"></i> ${projeto.localidade.cidade} / ${projeto.localidade.estado}                                                         
                                        </div>
                                      </div>
                                    </h6>
                                    <hr>
                                    <p class="card-text text-justify">
                                        <c:choose> 
                                          <c:when test = "${fn:length(projeto.resumo) > 250}">
                                            ${fn:substring(projeto.resumo, 0, 250)} ...
                                          </c:when>
                                          <c:otherwise>  
                                            ${projeto.resumo}
                                          </c:otherwise>
                                        </c:choose>
                                    </p>
                                  </div>
                                  <div class="mb-5 mt-2 d-flex flex-row justify-content-center">                          
                                    <a href="${context}/dashboard/projetos/${projeto.id}" class="btn btn-info btn-icon-split mx-2">
                                      <span class="icon text-white-50">
                                        <i class="fas fa-sign-in-alt"></i>
                                      </span>
                                      <span class="text">Detalhes</span>
                                    </a>
                                    <a href="${context}/dashboard/projetos/excluir/${projeto.id}" class="btn btn-danger btn-icon-split mx-2">
                                      <span class="icon text-white-50">
                                        <i class="far fa-times-circle"></i>
                                      </span>
                                      <span class="text">Excluir</span>
                                    </a>
                                  </div>
                                </div>
                              </div>  
                          </c:forEach> 
                        </div>   
                      </c:if>                                
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

<!-- Import Modal Cadastro Projeto -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cadastro-projeto.jsp" />
<!-- Import Modal Excluir Projeto -->
<c:import url="/WEB-INF/views/componentes/modal/modal-excluir-projeto.jsp" />

<!-- Bootstrap core JavaScript-->
<script src="${context}/dashboard/vendor/jquery/jquery.min.js"></script>
<script src="${context}/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/dashboard/vendor/bootstrap-taginput/js/bootstrap-tagsinput.js"></script>

<!-- Core plugin JavaScript-->
<script src="${context}/dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${context}/dashboard/js/sb-admin-2.min.js"></script>

<!-- Image Logo Preview-->
<script src="${context}/dashboard/js/image-preview.js"></script>

<!-- Field Validators-->
<script src="${context}/dashboard/vendor/jquery-mask-money/jquery.maskMoney.js"></script>
<script src="${context}/dashboard/vendor/jquery-mask-money/mask.js"></script>

</body>

</html>
