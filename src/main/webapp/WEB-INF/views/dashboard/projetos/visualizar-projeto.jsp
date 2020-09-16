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

    <title>Curadoria Yabá Consultoria - ${projeto.titulo}</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="${context}/images/favicon.png" type="image/x-icon">

    <!-- Fontawesome -->
    <link href="${context}/dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
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

                <div class="d-flex flex-row justify-content-between">

                    <div>
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">
                            <a href="${context}/dashboard/projetos">Projetos</a>
                            <small><i class="fas fa-angle-double-right text-primary mx-2"></i></small>
                            <a href="${context}/dashboard/projetos/${projeto.id}">Perfil Projeto</a>
                        </h1>
                    </div>
                </div>

                <!-- Projeto Profile -->
                <div class="card shadow my-5">

                    <!-- Projeto Profile - Header -->
                    <div class="card-header d-flex justify-content-between flex-wrap py-3">
                        <h5 class="m-0 font-weight-bold text-primary py-2"><i class="fas fa-edit"></i> ${projeto.titulo}
                        </h5>
                        <h5 class="m-0 font-weight-bold text-primary py-2"><i
                                class="fas fa-user-tie"></i> ${projeto.proponente}</h5>
                        <h5 class="m-0 font-weight-bold text-primary py-2"><i
                                class="fas fa-map-pin"></i> ${projeto.localidade.cidade} / ${projeto.localidade.estado}
                        </h5>
                    </div>

                    <!-- Projeto Profile - Body -->
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <!-- Left Column -->
                                <div class="col-xl-6 col-lg-12 col-md-12 col-12 px-4">

                                    <!-- Projeto Profile - Logo -->
                                    <div class="row d-flex justify-content-center">
                                        <img src="${context}/${projeto.logo.caminhoRelativo}"
                                             alt="Logo - ${projeto.titulo}" class="img-thumbnail">
                                    </div>

                                    <!-- Projeto Profile - Infos -->
                                    <div class="row mt-5">
                                        <div class="col-xl-6 col-12 my-2">
                                            <div class="card border-left-primary shadow h-100 py-2">
                                                <div class="card-body">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                                Beneficiários Direto
                                                            </div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${projeto.beneficiariosDireto}</div>
                                                        </div>
                                                        <div class="col-auto">
                                                            <i class="fas fa-people-arrows fa-2x text-gray-300"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-12 my-2">
                                            <div class="card border-left-primary shadow h-100 py-2">
                                                <div class="card-body">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                                Beneficiários Indireto
                                                            </div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${projeto.beneficiariosIndireto}</div>
                                                        </div>
                                                        <div class="col-auto">
                                                            <i class="fas fa-people-carry fa-2x text-gray-300"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-12 my-2">
                                            <div class="card border-left-primary shadow h-100 py-2">
                                                <div class="card-body">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                                Valor Solicitado
                                                            </div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                                R$ ${projeto.valorSolicitado}</div>
                                                        </div>
                                                        <div class="col-auto">
                                                            <i class="fas fa-comments-dollar fa-2x text-gray-300"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-12 my-2">
                                            <div class="card border-left-primary shadow h-100 py-2">
                                                <div class="card-body">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                                Valor Total
                                                            </div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                                R$ ${projeto.valorTotal}</div>
                                                        </div>
                                                        <div class="col-auto">
                                                            <i class="fas fa-hand-holding-usd fa-2x text-gray-300"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./ Projeto Profile - Infos -->

                                    <!-- Projeto Profile - Analyze -->
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card mb-4">
                                                <div class="card-header py-3">
                                                    <h4 class="m-0 font-weight-bold text-primary">Análises</h4>
                                                </div>
                                                <div class="card-body">
                                                    <h6 class="font-weight-bold my-3">Engajamento com os Stakeholders
                                                        <span class="float-right">
                                                        <c:if test="${projeto.analise.engajamentoStakeHolders eq 'RUIM'}">
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${projeto.analise.engajamentoStakeHolders eq 'MEDIO'}">
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${projeto.analise.engajamentoStakeHolders eq 'BOM'}">
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star text-warning"></i>
                                                        </c:if>
                                                    </span>
                                                    </h6>
                                                    <h6 class="font-weight-bold my-3">Alinhamento dos Negócios
                                                        <span class="float-right">
                                                        <c:if test="${projeto.analise.alinhamentoNegocios eq 'RUIM'}">
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${projeto.analise.alinhamentoNegocios eq 'MEDIO'}">
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${projeto.analise.alinhamentoNegocios eq 'BOM'}">
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star text-warning"></i>
                                                        </c:if>
                                                    </span>
                                                    </h6>
                                                    <h6 class="font-weight-bold my-3">Visibilidade
                                                        <span class="float-right">
                                                        <c:if test="${projeto.analise.visibilidade eq 'RUIM'}">
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${projeto.analise.visibilidade eq 'MEDIO'}">
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${projeto.analise.visibilidade eq 'BOM'}">
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star text-warning"></i>
                                                            <i class="fas fa-star text-warning"></i>
                                                        </c:if>
                                                    </span>
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./ Projeto Profile - Analyze -->

                                </div>
                                <!-- ./ Left Column -->

                                <!-- Right Column -->
                                <div class="col-xl-6 col-lg-12 col-md-12 col-12 px-4">
                                    <div class="row">
                                        <div class="col-12">
                                            <h3 class="font-weight-bold my-3 text-center">Resumo</h3>
                                            <div class="overflow-auto">
                                                <p class="text-justify p-4">${projeto.resumo}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-12">
                                            <h3 class="font-weight-bold my-3 text-center">Parceiros:</h3>
                                            <div class="overflow-auto">
                                                <p class="text-justify text-primary font-weight-bold p-4"
                                                   style="font-size: 24px;">
                                                    <c:if test="${empty projeto.parceiros}">
                                                        Não há parceiro(s) cadastrado(s) para este projeto.
                                                    </c:if>
                                                    <c:if test="${not empty projeto.parceiros}">
                                                        ${projeto.parceiros}
                                                    </c:if>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ./ Right Column -->
                            </div>
                        </div>
                    </div>
                    <!-- ./ Projeto Profile - Body -->
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

<!-- Modal Cadastro Empresa -->
<c:import url="/WEB-INF/views/componentes/modal/modal-cadastro-projeto.jsp"/>

<!-- Bootstrap core JavaScript-->
<script src="${context}/dashboard/vendor/jquery/jquery.min.js"></script>
<script src="${context}/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/dashboard/vendor/bootstrap-taginput/js/bootstrap-tagsinput.js"></script>

<!-- Core plugin JavaScript-->
<script src="${context}/dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${context}/dashboard/js/sb-admin-2.min.js"></script>

</body>

</html>
