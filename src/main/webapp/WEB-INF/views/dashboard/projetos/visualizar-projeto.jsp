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

    <title>Curadoria Yabá Consultoria - ${projeto.titulo}</title>

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
                        <h1 class="h3 mb-2 text-gray-800">Perfil Projeto</h1>                   
                    </div>
                </div>     

                <!-- Projeto Profile -->
                <div class="card shadow my-5">
                    <div class="card-header d-flex justify-content-between py-3">
                      <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-user"></i> Entidade: ${projeto.proponente}</h4>
                      <h4 class="m-0 font-weight-bold text-primary"><i class="far fa-newspaper"></i> Projeto: ${projeto.titulo}</h4>
                      <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-map-marked-alt"></i> Localidade: ${projeto.localidade.cidade} | ${projeto.localidade.estado}</h4>
                    </div>
                    <div class="card-body">
                      <div class="container-fluid">  
                          <div class="row">
                                <div class="col-6">
                                    <div class="row d-flex justify-content-center">
                                        <img src="${context}/${projeto.logo.caminhoRelativo}" alt="Logo - ${projeto.titulo}" class="img-thumbnail">
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col-xl-4 col-sm-12 mb-4">
                                          <div class="card border-left-primary shadow h-100 py-2">
                                            <div class="card-body">
                                              <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                  <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Beneficiários Direto</div>
                                                  <div class="h5 mb-0 font-weight-bold text-gray-800">${projeto.beneficiariosDireto}</div>
                                                </div>
                                                <div class="col-auto">
                                                  <i class="fas fa-people-arrows fa-2x text-gray-300"></i>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="col-xl-4 col-sm-12 mb-4">
                                          <div class="card border-left-primary shadow h-100 py-2">
                                            <div class="card-body">
                                              <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                  <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Beneficiários Indireto</div>
                                                  <div class="h5 mb-0 font-weight-bold text-gray-800">${projeto.beneficiariosIndireto}</div>
                                                </div>
                                                <div class="col-auto">
                                                  <i class="fas fa-people-carry fa-2x text-gray-300"></i>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="col-xl-4 col-sm-12 mb-4">
                                          <div class="card border-left-primary shadow h-100 py-2">
                                            <div class="card-body">
                                              <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                  <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Orçamento</div>
                                                  <div class="h5 mb-0 font-weight-bold text-gray-800">R$ ${projeto.orcamento}</div>
                                                </div>
                                                <div class="col-auto">
                                                  <i class="fas fa-hand-holding-usd fa-2x text-gray-300"></i>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card mb-4">
                                            <div class="card-header py-3">
                                              <h6 class="m-0 font-weight-bold text-primary">Análises</h6>
                                            </div>
                                            <div class="card-body">
                                              <h5 class="font-weight-bold my-3">Engajamento com os Stakeholders
                                                <span class="float-right">
                                                    <c:if test = "${projeto.analise.engajamentoStakeHolders eq 'RUIM'}"> 
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </c:if>
                                                    <c:if test = "${projeto.analise.engajamentoStakeHolders eq 'MEDIO'}"> 
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star"></i>
                                                    </c:if>
                                                    <c:if test = "${projeto.analise.engajamentoStakeHolders eq 'BOM'}"> 
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star text-warning"></i>
                                                    </c:if>
                                                </span>
                                              </h5>
                                              <h5 class="font-weight-bold my-3">Alinhamento dos Negócios
                                                <span class="float-right">
                                                    <c:if test = "${projeto.analise.alinhamentoNegocios eq 'RUIM'}"> 
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </c:if>
                                                    <c:if test = "${projeto.analise.alinhamentoNegocios eq 'MEDIO'}"> 
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star"></i>
                                                    </c:if>
                                                    <c:if test = "${projeto.analise.alinhamentoNegocios eq 'BOM'}"> 
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star text-warning"></i>
                                                    </c:if>
                                                </span>
                                              </h5>
                                              <h5 class="font-weight-bold my-3">Visibilidade
                                                <span class="float-right">
                                                    <c:if test = "${projeto.analise.visibilidade eq 'RUIM'}"> 
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </c:if>
                                                    <c:if test = "${projeto.analise.visibilidade eq 'MEDIO'}"> 
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star"></i>
                                                    </c:if>
                                                    <c:if test = "${projeto.analise.visibilidade eq 'BOM'}"> 
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star text-warning"></i>
                                                        <i class="fas fa-star text-warning"></i>
                                                    </c:if>
                                                </span>
                                              </h5>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <h1 class="font-weight-bold my-3 text-center">Resumo</h1>
                                    <div class="overflow-auto">
                                        <p class="text-justify p-4">${projeto.resumo}</p>
                                    </div>                                    
                                </div>
                          </div>
                      </div>
                    </div> 
                </div>   

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
