<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Curadoria - Yabá Consultoria</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="${context}/images/favicon.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${context}/home/vendor/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${context}/home/css/modern-business.css">

</head>

<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: #2c3e50 !important">
    <div class="container">
        <a class="navbar-brand" href="${context}/" style="font-weight: bold;">Seleção de Projeto - Yabá Consultoria</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdownPages"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        USUÁRIO
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-login">Login</a>
                        <a class="dropdown-item" href="#" data-toggle="modal"
                           data-target="#modal-register">Registrar-se</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<header>
    <div class="d-flex flex-row justify-content-center">
        <img src="${context}/images/bg-header.jpg" class="img-fluid" alt="Responsive image" style="width: 100vw">
    </div>
</header>

<!-- container -->
<div class="container">

    <!-- About -->
    <section class="about mt-5">
        <h1><i class="fas fa-door-open mx-2"></i> bem vindo!</h1>
        <h1>Plataforma Digital de Curadoria da Yabá</h1>
        <hr>
        <div class="about-content">
            <p>
                Essa plataforma foi desenvolvida para apoiar o Comitê de Sustentabilidade da Leroy Merlin à selecionar
                os projetos que serão incentivados via dedução do Imposto de Renda em 2020, facilitando todo o processo
                de tomada de decisão para o aporte financeiro dos projetos selecionados.
            </p>
            <p>São 4 categorias:</p>
            <ul>
                <li>Fundo da Criança e do Adolescente;</li>
                <li>Fundo do Idoso;</li>
                <li>Lei de Incentivo ao Esporte;</li>
                <li>Lei de Incentivo à Cultura.</li>
            </ul>
            <p>
                Desenvolvida pensando na melhor experiência do usuário, a plataforma conta com um template moderno,
                intuitivo e responsivo. Veja abaixo como utilizar sua funcionalidades.
            </p>
        </div>
    </section>
    <!-- /. About section -->

    <!-- How To Use Section -->
    <section class="how-to-use mt-5">
        <div class="row">
            <div class="col-12">
                <h2><i class="fas fa-sitemap mx-2"></i> Como Utilizar</h2>
                <hr>
                <div class="how-to-use-content">
                    <p>Para acessar o painel com as categorias disponíveis ao Comitê, o usuário precisa apenas se
                        cadastrar informando <b>Nome*</b> e <b>E-mail*</b>.</p>
                    <p>Após acessar o painel, o usuário pode:</p>
                    <ul>
                        <li>Visualizar campanhas;</li>
                        <li>Visualizar enquentes;</li>
                        <li>Visualizar projetos;</li>
                        <li><b>Votar em projetos participantes das enquetes</b>;</li>
                        <li><b>Visualizar resultados em tempo real</b>.</li>
                    </ul>
                    <p>Todas as funcionalidades pensadas para facilitar e agilizar os processos para você!</p>
                </div>
            </div>
        </div>
        <div class="d-flex flex-row justify-content-around flex-wrap mt-3">
            <div class="col-12 align-items-center">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="img-thumbnail" src="${context}/images/how-to-use/img-1.png" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="img-thumbnail" src="${context}/images/how-to-use/img-2.png" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="img-thumbnail" src="${context}/images/how-to-use/img-3.png" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- /. How to Use Secion -->

    <!-- Get Start Section -->
    <section>
        <div class="row mt-5">
            <div class="col-12">
                <h5 class="font-weight-bold">Comece agora essa nova experência!</h5>
                <p>Realize seu cadastro e acesso o painel junto com seu time para obterem a melhor tomada de decisão e
                    resultados incríveis.</p>
            </div>
        </div>

        <div class="d-flex flex-row justify-content-center mt-3">
            <a class="btn btn-lg btn-warning mx-2 p-2 text-white font-weight-bold" href="#" data-toggle="modal"
               data-target="#modal-register">Cadastrar-se</a>
            <a class="btn btn-lg btn-dark mx-2 p-2 font-weight-bold" href="#" data-toggle="modal"
               data-target="#modal-login">Entrar</a>
        </div>
    </section>
    <!-- /. Get Start Section -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark mt-5">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Yabá Consultoria 2020</p>
    </div>
</footer>
<!-- /. Footer -->


<!-- Components Import -->
<c:import url="/WEB-INF/views/componentes/modal/modal-login.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-register.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-alert-cadastro-usuario.jsp"/>
<c:import url="/WEB-INF/views/componentes/modal/modal-alert-login.jsp"/>


<!-- Bootstrap core JavaScript -->
<script src="${context}/home/vendor/jquery/jquery.min.js"></script>
<script src="${context}/home/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<c:if test="${not empty registerSuccess or not empty registerDanger}">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#modal-alert-cadastro-usuario').modal('show');
        });
    </script>
</c:if>
<c:if test="${loginIncorrect}">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#modal-alert-login').modal('show');
        });
    </script>
</c:if>

</body>

</html>
