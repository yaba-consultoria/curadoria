<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <title>Curadoria Yabá Consultoria - Categorias</title>
    <!-- favicon -->
    <link rel="shortcut icon" href="/images/favicon.png" type="image/x-icon">

    <!-- Custom fonts for this template -->
    <link href="${context}/dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${context}/dashboard/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css" rel="stylesheet">

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

                <div class="d-flex flex-row justify-content-between flex-wrap">

                    <div>
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">
                            <a href="${context}/dashboard/campanhas">Campanhas</a>
                            <small><i class="fas fa-angle-double-right text-primary mx-2"></i></small>
                            <a href="${context}/dashboard/campanhas/${campanha.id}">Perfil Campanha</a>
                            <small><i class="fas fa-angle-double-right text-primary mx-2"></i></small>
                            <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}">Perfil Categoria</a>
                        </h1>
                    </div>
                    
                    <div>
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800"> 
                            <c:if test = "${categoria.status eq 'CRIADO'}">
                                <span class="badge badge-warning ml-2 p-2">Status: ${categoria.status.descricao}</span>
                            </c:if>
                            <c:if test = "${categoria.status eq 'ABERTO'}">
                                <span class="badge badge-success ml-2 p-2">Status: ${categoria.status.descricao}</span>
                            </c:if>
                            <c:if test = "${categoria.status eq 'FECHADO'}">
                                <span class="badge badge-danger ml-2 p-2">Status: ${categoria.status.descricao}</span>
                            </c:if>
                        </h1>                 
                    </div>
                    <c:if test = "${usuario.admin}">
                        <div>
                            <!-- Botão Alterar Status da Campanha -->
                            <button class="btn btn-primary" data-toggle="modal" data-target="#modal-alterar-status-categoria">Alterar Status</button>
                            <!-- Botão Nova Campanha -->
                            <button class="btn btn-primary" data-toggle="modal" data-target="#modal-indicar-projeto-categoria">Indicar Projeto</button>
                        </div>
                    </c:if>
                </div>

                <!-- Alert Default -->
                <div class="row mt-5">
                  <div class="col-12">
                    <c:import url="/WEB-INF/views/componentes/alert/alert-default.jsp" />
                  </div>
                </div>

                
                <form class="mt-5">
                    <div class="row">
                        <div class="col-xl-4 col-12">
                            <div class="form-group">
                                <label>Empresa:</label>
                                <input type="text" class="form-control" value="${campanha.empresa.nome}" readonly required>     
                            </div>
                        </div>
                        <div class="col-xl-4 col-12">
                            <div class="form-group">
                                <label>Nome da Campanha:</label>
                                <input type="text" class="form-control" value="${campanha.nome}" readonly required>     
                            </div>
                        </div>
                        <div class="col-xl-4 col-12">
                            <div class="form-group">
                                <label>Categoria:</label>
                                <input type="text" class="form-control" value="${categoria.tipo.descricao}" readonly required>     
                            </div>
                        </div>
                    </div>
                </form>   

                <!-- DataTales Example -->
                <h2 class="mt-4">Projetos Indicados</h2>                
                <c:if test = "${not empty categoria.projetos}">
                    <div class="card shadow mb-4 mt-4">
                        <div class="d-flex flex-row justify-content-between card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Projetos</h6>
                            <c:if test = "${!usuario.admin}"> 
                                <c:if test = "${usuario.votosDisponiveis > 0}"> 
                                    <h6 class="m-0 font-weight-bold text-primary">Votos Disponíveis: ${usuario.votosDisponiveis}</h6>
                                </c:if>
                                <c:if test = "${usuario.votosDisponiveis == 0}"> 
                                    <h6 class="m-0 font-weight-bold text-danger">Votos Disponíveis: ${usuario.votosDisponiveis}</h6>
                                </c:if>
                            </c:if>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <c:forEach var="projeto" items="${categoria.projetos}">
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
                                          <a href="${context}/dashboard/projetos/${projeto.id}" class="btn btn-info btn-icon-split mx-2" target="_blank">
                                            <span class="icon text-white-50">
                                              <i class="fas fa-sign-in-alt"></i>
                                            </span>
                                            <span class="text">Detalhes</span>
                                          </a>
                                          <c:if test = "${usuario.admin}">
                                              <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}/projetos/${projeto.id}/excluir" class="btn btn-danger btn-icon-split mx-2">
                                                <span class="icon text-white-50">
                                                  <i class="far fa-times-circle"></i>
                                                </span>
                                                <span class="text">Excluir</span>
                                              </a>
                                          </c:if>
                                          <c:if test = "${!usuario.admin}">
                                                <c:if test = "${!projeto.canVote}">  
                                                  <form action="${context}/dashboard/campanhas/${categoria.campanha.id}/categorias/${categoria.id}/projetos/${projeto.id}/votar" method="post">
                                                      <button type="submit" class="btn btn-success btn-icon-split mx-2">
                                                        <span class="icon text-white-50">
                                                          <i class="far fa-times-circle"></i>
                                                        </span>
                                                        <span class="text">Votar</span>                                                    
                                                      </button>
                                                  </form>
                                                </c:if>
                                                <c:if test = "${projeto.canVote}">
                                                  <button disabled class="btn btn-danger btn-icon-split mx-2">
                                                    <span class="icon text-white-50">
                                                      <i class="far fa-times-circle"></i>
                                                    </span>
                                                    <span class="text">Votar</span>                                                    
                                                  </button>
                                                </c:if>
                                          </c:if>
                                        </div>
                                      </div>
                                    </div>  
                                </c:forEach> 
                            </div>                     
                        </div>
                    </div>
                </c:if>
                <c:if test = "${empty categoria.projetos}"> 
                    <div class="alert alert-danger mt-4" role="alert">
                      <h4 class="alert-heading">Sem Registros</h4>
                      <p>Não há registros de projetos indicados nesta categoria.</p>
                    </div>
                </c:if> 

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

<!-- Modal Altear Status Categoria -->
<c:import url="/WEB-INF/views/componentes/modal/modal-alterar-status-categoria.jsp" />

<!-- Modal Indicar Projeto Categoria -->
<c:import url="/WEB-INF/views/componentes/modal/modal-indicar-projeto-categoria.jsp" />

<!-- Logout Modal-->
<c:import url="/WEB-INF/views/componentes/modal/modal-logout.jsp" />



<!-- Bootstrap core JavaScript-->
<script src="${context}/dashboard/vendor/jquery/jquery.min.js"></script>
<script src="${context}/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${context}/dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${context}/dashboard/js/sb-admin-2.min.js"></script>

<!-- Field Validators-->
<script src="${context}/dashboard/js/cnpj-validator.js"></script>
<script src="${context}/dashboard/vendor/jquery-mask/jquery.mask.js"></script>
<script src="${context}/dashboard/vendor/jquery-mask/mask.js"></script>

<!-- Page level plugins -->
<script src="${context}/dashboard/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${context}/dashboard/js/demo/datatables-demo.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>

</body>

</html>
