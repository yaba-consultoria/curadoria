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

    <title>Curadoria Yabá Consultoria - Clientes</title>

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
                        <button class="btn btn-primary" data-toggle="modal" data-target="#modal-cadastro-projeto">Nova Projeto</button>
                    </div>
                </div>                

                <!-- Card List -->
                <c:if test = "${not empty projetos.content}">
                    <div class="card shadow mb-4 mt-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Projetos</h6>
                        </div>
                        <div class="card-body">
                            <c:forEach var="projeto" items="${projetos.content}">
                                <div class="card-deck mt-4">
                                  <div class="col-md-12 col-lg-6 col-xl-4">  
                                      <div class="card">
                                        <img src="${context}/${projeto.logo.caminhoRelativo}" class="card-img-top" alt="logo" style="max-height: 300px;">
                                        <div class="card-body">
                                          <h5 class="card-title">
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
                                                <c:when test = "${fn:length(projeto.titulo) > 80}">
                                                  ${fn:substring(projeto.resumo, 0, 80)} ...
                                                </c:when>
                                                <c:otherwise>  
                                                  ${projeto.resumo}
                                                </c:otherwise>
                                              </c:choose>
                                          </p>
                                        </div>
                                        <div class="mb-5 mt-2 d-flex flex-row justify-content-center">                          
                                          <a href="#" class="btn btn-primary btn-icon-split">
                                            <span class="icon text-white-50">
                                              <i class="fas fa-sign-in-alt"></i>
                                            </span>
                                            <span class="text">Detalhes</span>
                                          </a>
                                        </div>
                                      </div>
                                  </div>
                                </div>  
                            </c:forEach>                     
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

<!-- Modal Cadastro Empresa -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cadastro-projeto.jsp" />

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
