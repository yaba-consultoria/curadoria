<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
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
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${context}/dashboard/css/sb-admin-2.css" rel="stylesheet">
    <!-- Data Tables -->
    <link href="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- Bootstrap Select -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css"
          rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Import Sidebar -->
    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-dashboard.jsp"/>
    <!-- End Import Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Import Topbar -->
            <c:import url="/WEB-INF/views/componentes/topbar/topbar-dashboard.jsp"/>
            <!-- End Import Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <div class="d-flex flex-row justify-content-between flex-wrap">

                    <div>
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">
                            <a href="${context}/dashboard/campanhas">Campanhas</a>
                            <small><i class="fas fa-angle-double-right text-primary mx-2"></i></small>
                            <a href="${context}/dashboard/campanhas/${campanha.id}">Perfil Campanha</a>
                        </h1>
                    </div>
                    <div>
                        <!-- Status Projeto -->
                        <h1 class="h3 mb-2 text-gray-800">
                            <c:if test="${campanha.status eq 'CRIADO'}">
                                <span class="badge badge-warning ml-2 p-2">Status: ${campanha.status.descricao}</span>
                            </c:if>
                            <c:if test="${campanha.status eq 'ABERTO'}">
                                <span class="badge badge-success ml-2 p-2">Status: ${campanha.status.descricao}</span>
                            </c:if>
                            <c:if test="${campanha.status eq 'FECHADO'}">
                                <span class="badge badge-danger ml-2 p-2">Status: ${campanha.status.descricao}</span>
                            </c:if>
                        </h1>
                    </div>
                    <c:if test="${usuario.admin}">
                        <div>
                            <!-- Botão Alterar Status da Campanha -->
                            <button class="btn btn-primary" data-toggle="modal"
                                    data-target="#modal-alterar-status-campanha">Alterar Status
                            </button>
                            <!-- Botão Nova Campanha -->
                            <button class="btn btn-primary" data-toggle="modal"
                                    data-target="#modal-cadastro-categoria-campanha">Nova Categoria
                            </button>
                        </div>
                    </c:if>
                </div>


                <form class="mt-5">
                    <div class="row">
                        <div class="col-xl-6 col-12">
                            <div class="form-group">
                                <label for="empresas">Empresa:</label>
                                <input type="text" class="form-control" id="empresas" value="${campanha.empresa.nome}"
                                       readonly required>
                            </div>
                        </div>
                        <div class="col-xl-6 col-12">
                            <div class="form-group">
                                <label for="nome-campanha">Nome da Campanha:</label>
                                <input type="text" class="form-control" id="nome-campanha" value="${campanha.nome}"
                                       readonly required>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- Alert Default -->
                <div class="row mt-5">
                    <div class="col-12">
                        <c:import url="/WEB-INF/views/componentes/alert/alert-default.jsp"/>
                    </div>
                </div>

                <!-- Alert Sem Registros -->
                <h2 class="mt-4">Categorias</h2>
                <c:if test="${empty campanha.categorias}">
                    <div class="alert alert-danger mt-4" role="alert">
                        <h4 class="alert-heading">Sem Registros</h4>
                        <p>Não há registros de categorias no servidor.</p>
                    </div>
                </c:if>

                <!-- DataTales Categorias -->
                <c:if test="${not empty campanha.categorias}">
                    <div class="card shadow mb-4 mt-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Categorias</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center" id="dataTable">
                                    <thead>
                                    <tr>
                                        <th>Tipo</th>
                                        <th>Status</th>
                                        <th>Projetos Indicados</th>
                                        <th>Votos Computados</th>
                                        <th>Ações</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="categoria" items="${campanha.categorias}">
                                        <tr>
                                            <td>${categoria.tipo.descricao}</td>
                                            <td>
                                                <c:if test="${categoria.status eq 'CRIADO'}">
                                                    <span class="btn btn-sm btn-warning">${categoria.status.descricao}</span>
                                                </c:if>
                                                <c:if test="${categoria.status eq 'ABERTO'}">
                                                    <span class="btn btn-sm btn-success">${categoria.status.descricao}</span>
                                                </c:if>
                                                <c:if test="${categoria.status eq 'FECHADO'}">
                                                    <span class="btn btn-sm btn-danger">${categoria.status.descricao}</span>
                                                </c:if>
                                            </td>
                                            <td>${categoria.projetos.size()}</td>
                                            <td>${categoria.votos.size()}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${categoria.status eq 'CRIADO' and !usuario.admin}">
                                                        <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}"
                                                           title="Visualizar"
                                                           style="pointer-events: none; cursor: default; color: gray;">
                                                            <i class="far fa-list-alt"></i>
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${categoria.status eq 'CRIADO' and usuario.admin}">
                                                        <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}"
                                                           title="Visualizar">
                                                            <i class="far fa-list-alt"></i>
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${categoria.status eq 'FECHADO' and !usuario.admin}">
                                                        <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}"
                                                           title="Visualizar"
                                                           style="pointer-events: none; cursor: default; color: red;">
                                                            <i class="far fa-list-alt"></i>
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}"
                                                           title="Visualizar">
                                                            <i class="far fa-list-alt"></i>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:if test="${usuario.admin}">
                                                    <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}/excluir"
                                                       title="Excluir">
                                                        <i class="far fa-times-circle ml-2"></i>
                                                    </a>
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${categoria.status eq 'FECHADO'}">
                                                        <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}/resultados"
                                                           title="Resultados">
                                                            <i class="fas fa-poll ml-2"></i>
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${usuario.admin}">
                                                        <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}/resultados"
                                                           title="Resultados">
                                                            <i class="fas fa-poll ml-2"></i>
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}/resultados"
                                                           title="Resultados"
                                                           style="pointer-events: none; cursor: default; color: gray;">
                                                            <i class="fas fa-poll ml-2"></i>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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

<!-- Import Modal Cadastro Campanha -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cadastro-campanha.jsp"/>
<!-- Import Modal Alterar Status Campanha -->
<c:import url="/WEB-INF/views/componentes/modal/modal-alterar-status-campanha.jsp"/>
<!-- Import Modal Cadatsro Categoria Campanha -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cadastro-categoria-campanha.jsp"/>

<!-- Bootstrap core JavaScript-->
<script src="${context}/dashboard/vendor/jquery/jquery.min.js"></script>
<script src="${context}/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${context}/dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${context}/dashboard/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${context}/dashboard/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="${context}/dashboard/js/demo/datatables-default.js"></script>

<!-- Bootstrap Select -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>

</body>

</html>
