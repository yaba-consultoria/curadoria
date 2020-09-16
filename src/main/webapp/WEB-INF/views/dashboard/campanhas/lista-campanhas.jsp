<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Curadoria Yabá Consultoria - Campanhas</title>
    <!-- Fontawesome -->
    <link href="${context}/dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${context}/dashboard/css/sb-admin-2.css" rel="stylesheet">
    <!-- Data Tables -->
    <link href="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
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
                    
                    <div>
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">
                            <a href="${context}/dashboard/campanhas">Campanhas</a>
                        </h1>                     
                    </div>
                    <div>
                        <!-- Botão Nova Campanha -->
                        <button class="btn btn-primary" data-toggle="modal" data-target="#modal-cadastro-campanha">Nova Campanha</button>
                    </div>
                </div>

                
                <div class="card shadow mb-4 mt-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Lista de Campanhas</h6>
                    </div>
                    <div class="card-body">
                        
                        <!-- Alert Default -->
                        <div class="row">
                           <div class="col-12">
                             <c:import url="/WEB-INF/views/componentes/alert/alert-default.jsp" />
                           </div>
                        </div>

                        <!-- Alert Sem Registros -->
                        <c:if test = "${empty campanhas}"> 
                            <div class="alert alert-danger mt-4" role="alert">
                              <h4 class="alert-heading">Sem Registros</h4>
                              <p>Não há registros de campanhas no servidor.</p>
                            </div>
                        </c:if>

                        <!-- DataTales Campanha -->
                        <c:if test = "${not empty campanhas}"> 
                            <div class="table-responsive">
                                <table class="table table-bordered text-center" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>Data Criada</th>
                                            <th>Status</th>
                                            <th>Nome</th>
                                            <th>Empresa</th>
                                            <th>Categorias</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>
                                        <c:forEach var="campanha" items="${campanhas}">
                                            <tr>
                                                <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${campanha.dataRegistro}" var="dataRegistro"/>
                                                <td>${dataRegistro}</td>
                                                <td>
                                                    <c:if test = "${campanha.status eq 'CRIADO'}">
                                                        <span class="btn btn-sm btn-warning">${campanha.status.descricao}</span>
                                                    </c:if>
                                                    <c:if test = "${campanha.status eq 'ABERTO'}">
                                                        <span class="btn btn-sm btn-success">${campanha.status.descricao}</span>
                                                    </c:if>
                                                    <c:if test = "${campanha.status eq 'FECHADO'}">
                                                        <span class="btn btn-sm btn-danger">${campanha.status.descricao}</span>
                                                    </c:if>
                                                </td>
                                                <td>${campanha.nome}</td>
                                                <td>${campanha.empresa.nome}</td>
                                                <td>${campanha.categorias.size()}</td>
                                                <td>
                                                    <a href="${context}/dashboard/campanhas/${campanha.id}" title="Visualizar">
                                                        <i class="fas fa-sign-out-alt"></i>
                                                    </a>
                                                    <c:if test = "${usuario.admin}">
                                                        <a href="${context}/dashboard/campanhas/${campanha.id}/excluir" title="Excluir">
                                                            <i class="far fa-times-circle ml-2"></i>
                                                        </a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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

<!-- Import Modal Cadastro Campanha -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cadastro-campanha.jsp" />

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
<script src="${context}/dashboard/js/demo/datatables-default.js"></script>

</body>

</html>
