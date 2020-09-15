<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
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
    <!-- favicon -->
    <link rel="shortcut icon" href="/images/favicon.png" type="image/x-icon">

    <!-- Custom fonts for this template -->
    <link href="${context}/dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${context}/dashboard/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
                    <h1 class="h3 mb-2 text-gray-800">Empresas</h1>
                    <button class="btn btn-primary" data-toggle="modal" data-target="#modal-cadastro-empresa">Nova Empresa</button>
                    
                </div>

                <!-- Alert Default -->
                <div class="row">
                  <div class="col-12">
                    <c:import url="/WEB-INF/views/componentes/alert/alert-default.jsp" />
                  </div>
                </div>

                <!-- DataTales Example -->
                <c:if test = "${not empty empresas}">
                <div class="card shadow mb-4 mt-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Lista de Empresas</h6>
                    </div>
                    <div class="card-body">
                        <c:if test = "${not empty empresas}"> 
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>CNPJ</th>
                                    </tr>
                                    </thead>                                    
                                    <tbody>
                                    <c:forEach var="empresa" items="${empresas}">
                                        <tr>
                                            <td>${empresa.nome}</td>
                                            <td>${empresa.cnpj}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>                        
                    </div>
                </div>
                </c:if>
                <c:if test = "${empty empresas}"> 
                    <div class="alert alert-danger mt-4" role="alert">
                      <h4 class="alert-heading">Sem Registros</h4>
                      <p>Não há registros de empresas no servidor.</p>
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

<!-- Modal Cadastro Empresa -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cadastro-empresa.jsp" />

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

</body>

</html>
