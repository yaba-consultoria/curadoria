<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
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
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${context}/dashboard/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${context}/dashboard/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css"
          rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <c:import url="/WEB-INF/views/componentes/sidebar/sidebar-dashboard.jsp"/>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <c:import url="/WEB-INF/views/componentes/topbar/topbar-dashboard.jsp"/>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <div class="d-flex flex-row justify-content-between">

                    <div>
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">
                            <c:if test="${categoria.status eq 'CRIADO'}">
                                <span class="badge badge-warning ml-2">Status: ${categoria.status.descricao}</span>
                            </c:if>
                            <c:if test="${categoria.status eq 'ABERTO'}">
                                <span class="badge badge-success ml-2">Status: ${categoria.status.descricao}</span>
                            </c:if>
                            <c:if test="${categoria.status eq 'FECHADO'}">
                                <span class="badge badge-danger ml-2">Status: ${categoria.status.descricao}</span>
                            </c:if>
                        </h1>
                    </div>
                </div>


                <form class="mt-5">
                    <div class="row">
                        <div class="col-4">
                            <div class="form-group">
                                <label>Empresa:</label>
                                <input type="text" class="form-control" value="${campanha.empresa.nome}" readonly
                                       required>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label>Nome da Campanha:</label>
                                <input type="text" class="form-control" value="${campanha.nome}" readonly required>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label>Categoria:</label>
                                <input type="text" class="form-control" value="${categoria.tipo.descricao}" readonly
                                       required>
                            </div>
                        </div>
                    </div>
                </form>


                <!-- DataTales Example -->
                <h2 class="mt-4">Resultados da Categoria</h2>
                <!-- Alert Sem Registros -->                
                <c:if test = "${empty rankingProjetos}"> 
                    <div class="alert alert-danger mt-4" role="alert">
                      <h4 class="alert-heading">Sem Registros</h4>
                      <p>Não há resultados desta categorias para ser exibido(s).</p>
                    </div>
                </c:if> 
                <c:if test="${not empty rankingProjetos}">

                    <div class="row my-3">
                        <!-- Total de Projetos -->
                        <div class="col-xl-4 col-md-4 col-12 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total
                                                de Projetos
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${rankingProjetos.size()}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-project-diagram fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Total de Votos -->
                        <div class="col-xl-4 col-md-4 col-12 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total
                                                de Votos
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalVotos}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-hand-point-up fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Total de Usuário que Votaram -->
                        <div class="col-xl-4 col-md-4 col-12 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Usuários Votantes
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalUsuariosWithVoto}
                                                <small>de</small> ${totalUsuarios}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user-tag fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-12">
                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Usuários x
                                        Votos: ${usuariosUmVoto.size()}</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="usuario-votos"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card shadow my-3">
                        <div class="d-flex flex-row justify-content-between card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Ranking Categoria</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table table-bordered text-center" id="data-table-ranking-categoria"
                                           width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>Projeto</th>
                                            <th>Proponente</th>
                                            <th>Localidade</th>
                                            <th>Votos</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="projeto" items="${rankingProjetos}">
                                            <tr>
                                                <td>${projeto.titulo}</td>
                                                <td>${projeto.proponente}</td>
                                                <td>${projeto.localidade.cidade} / ${projeto.localidade.estado}</td>
                                                <td>${projeto.totalVotos}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
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

<!-- Modal Altear Status Categoria -->
<c:import url="/WEB-INF/views/componentes/modal/modal-alterar-status-categoria.jsp"/>

<!-- Modal Indicar Projeto Categoria -->
<c:import url="/WEB-INF/views/componentes/modal/modal-indicar-projeto-categoria.jsp"/>

<!-- Logout Modal-->
<c:import url="/WEB-INF/views/componentes/modal/modal-logout.jsp"/>


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
<!-- Charts js -->
<script src="${context}/dashboard/vendor/chart.js/Chart.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#data-table-ranking-categoria').DataTable({
            "order": [[3, "desc"]]
        });
    });
</script>

<script type="text/javascript">
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#858796';

    async function buildChart() {
        let endpoint = "https://curadoria.yabaconsultoria.com.br/endpoint/campanhas/${campanha.id}/categorias/${categoria.id}/resultado/votos";
        let response = await fetch(endpoint, {
            method: 'GET',
            headers: {
                "Content-Type": "text/plain"
            }
        })
        .then(res => res.json())
        let data = await response;        

        // Bar Chart Example
        var ctx = document.getElementById("usuario-votos");
        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["0 Votos", "1 Voto", "2 Votos", "3 Votos"],
                datasets: [{
                    label: "Usuários",
                    backgroundColor: "#2ecc71",
                    hoverBackgroundColor: "#27ae60",
                    borderColor: "#2ecc71",
                    data: await data,
                }],
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                legend: {
                    display: false
                },
                tooltips: {
                    titleMarginBottom: 10,
                    titleFontColor: '#6e707e',
                    titleFontSize: 14,
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                },
            }
        });

    }

    buildChart();


</script>

</body>

</html>
