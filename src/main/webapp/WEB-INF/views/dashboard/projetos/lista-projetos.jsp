<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    <!-- Custom fonts for this template -->
    <link href="${context}/dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${context}/dashboard/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${context}/dashboard/css/rating.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- Bootstrap TagInput -->
    <link href="${context}/dashboard/vendor/bootstrap-taginput/css/bootstrap-tagsinput.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
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

                <div class="d-flex flex-row justify-content-between">
                    
                    <div>
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Projetos</h1>                   
                    </div>
                    <div>
                        <!-- Botão Nova Empresa -->
                        <button class="btn btn-primary" data-toggle="modal" data-target="#modal-cadastro-projeto">Novo Projeto</button>
                    </div>
                </div>                

                <!-- Card List -->
                <c:if test = "${not empty projetos.content}">                    
                    <div class="card shadow mb-4 mt-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Projetos</h6>
                        </div>
                        <div class="card-body">
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
                                  <nav class="" aria-label="Paginação de Projetos">
                                    <ul class="pagination"> 
                                      <c:choose> 
                                        <c:when test = "${projetos.totalPages == 1}">
                                          <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                                          <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
                                          <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                                        </c:when>
                                        <c:when test = "${(projetos.totalPages == 2) && (projetos.number + 1 < projetos.totalPages)}">
                                          <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                                          <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number + 1}&titulo=${titulo}">${projetos.number + 2}</a></li>
                                          <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                                        </c:when>
                                        <c:when test = "${(projetos.totalPages == 2) && (projetos.number + 1 == projetos.totalPages)}">
                                          <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number - 1}&titulo=${titulo}">${projetos.number}</a></li>
                                          <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
                                          <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
                                        </c:when>
                                        <c:when test = "${(projetos.totalPages >= 3) && (projetos.number == 0)}">
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?&titulo=${titulo}">Primeira</a></li>
                                          <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number + 1}&titulo=${titulo}">${projetos.number + 2}</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number + 2}&titulo=${titulo}">${projetos.number + 3}</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.totalPages - 1}&titulo=${titulo}">Última</a></li>
                                        </c:when>
                                        <c:when test = "${(projetos.totalPages >= 3) && (projetos.number > 0) && (projetos.number + 1 < projetos.totalPages)}">
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?&titulo=${titulo}">Primeira</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number - 1}&titulo=${titulo}">${projetos.number}</a></li>
                                          <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number + 1}&titulo=${titulo}">${projetos.number + 2}</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.totalPages - 1}&titulo=${titulo}">Última</a></li>
                                        </c:when>
                                        <c:when test = "${(projetos.totalPages >= 3) && (projetos.number + 1 == projetos.totalPages)}">
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?&titulo=${titulo}">Primeira</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number - 2}&titulo=${titulo}">${projetos.number - 1}</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number - 1}&titulo=${titulo}">${projetos.number}</a></li>
                                          <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
                                          <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.totalPages - 1}&titulo=${titulo}">Última</a></li>
                                        </c:when>
                                      </c:choose> 
                                    </ul>
                                  </nav>  
                                </div>
                            </div>               
                            <div class="row">
                                <c:forEach var="projeto" items="${projetos.content}">
                                    <div class="card-deck col-md-12 col-lg-6 col-xl-4 mt-4">                                      
                                      <div class="card">
                                        <img src="${context}/${projeto.logo.caminhoRelativo}" class="card-img-top" alt="logo" style="max-height: 260px;">
                                        <div class="card-body">
                                          <h5 class="card-title font-weight-bold">
                                              <c:choose> 
                                                <c:when test = "${fn:length(projeto.titulo) > 25}">
                                                  ${fn:substring(projeto.titulo, 0, 25)} ...
                                                </c:when>
                                                <c:otherwise>  
                                                  ${projeto.titulo}
                                                </c:otherwise>
                                              </c:choose>
                                          </h5>
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
                                          <a href="${context}/dashboard/projetos/${projeto.id}" class="btn btn-primary btn-icon-split mx-2">
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
                        </div>                        
                    </div>                    
                </c:if>
                <c:if test = "${empty projetos.content}"> 
                    <div class="alert alert-danger mt-4" role="alert">
                      <h4 class="alert-heading">Sem Registros</h4>
                      <p>Não há registros de projetos no servidor.</p>
                    </div>
                </c:if>       

                <c:if test = "${not empty success}"> 
                    <div class="row mt-4">
                        <div class="col-12">
                            <!-- Alert Cadastro Empresa -->
                            <c:import url="/WEB-INF/views/componentes/alert/alert-success.jsp" />
                        </div>
                    </div>
                </c:if>   

                <c:if test = "${not empty danger}"> 
                    <div class="row mt-4">
                        <div class="col-12">
                            <!-- Alert Cadastro Empresa -->
                            <c:import url="/WEB-INF/views/componentes/alert/alert-danger.jsp" />
                        </div>
                    </div>
                </c:if>        

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Modal Cadastro Projeto -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cadastro-projeto.jsp" />
<!-- Modal Excluir Projeto -->
<c:import url="/WEB-INF/views/componentes/modal/modal-excluir-projeto.jsp" />

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>



<!-- Bootstrap core JavaScript-->
<script src="${context}/dashboard/vendor/jquery/jquery.min.js"></script>
<script src="${context}/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/dashboard/vendor/bootstrap-taginput/js/bootstrap-tagsinput.js"></script>

<!-- Core plugin JavaScript-->
<script src="${context}/dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${context}/dashboard/js/sb-admin-2.min.js"></script>
<script src="${context}/dashboard/js/image-preview.js"></script>

<!-- Field Validators-->
<script src="${context}/dashboard/vendor/jquery-mask-money/jquery.maskMoney.js"></script>
<script src="${context}/dashboard/vendor/jquery-mask-money/mask.js"></script>

<!-- Page level plugins -->
<script src="${context}/dashboard/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${context}/dashboard/js/demo/datatables-demo.js"></script>

</body>

</html>
