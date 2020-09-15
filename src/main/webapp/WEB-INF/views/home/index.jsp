<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="pt-br">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Curadoria - Yabá Consultoria</title>
  <!-- favicon -->
  <link rel="shortcut icon" href="/images/favicon.png" type="image/x-icon">

  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">

  <!-- Bootstrap core CSS -->
  <link href="${context}/home/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Fontawesome -->
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

  <!-- Custom styles for this template -->
  <link href="${context}/home/css/modern-business.css" rel="stylesheet">
  <style type="text/css">
    *, :after, :before {
      box-sizing: border-box;
    }
    html, body{
      font-family: poppins,lato,sans-serif;      
      font-style: normal;
      line-height: 1.8;
    }
    p{
      color: #384257;
      font-size: 18px;
      font-weight: 500;
      text-align: justify;
      margin: 1em 0 1.5em;
    }
    .about{
      margin-top: 30px;
    }

    .about h1{      
      color: #2c3e50; 
      text-transform: uppercase;
      font-weight: bold;
      text-shadow: 1px 0px 5px rgba(150, 150, 150, 1);
      text-align: center;
    }

    .about-content{
      padding: 30px 0px;
    }    
    
    .how-to-use{
      margin-top: 10px;
    }

    .how-to-use h2{      
      color: #2c3e50; 
      text-transform: uppercase;
      font-weight: bold;
      text-shadow: 1px 0px 5px rgba(150, 150, 150, 1);
      text-align: left;
    }
    .how-to-use-content{
      padding: 30px 0px;
    }

    /* Small devices (tablets, 768px and up) */
    @media (max-width: 767px) {
      .about h1{
        font-size: 1.75rem;
      }
      .how-to-use h2{ 
        font-size: 1.55rem;
      }
    }

    /* Small devices (tablets, 768px and up) */
    @media (min-width: 768px) {
      .about h1{
        font-size: 2rem;
      }
      .how-to-use h2{ 
        font-size: 1.75;
      }
    }

    /* Medium devices (desktops, 992px and up) */
    @media (min-width: 992px) {
      .about h1{
        font-size: 2.25rem;
      }
      .how-to-use h2{ 
        font-size: 2rem;
      }
    }

    /* Large devices (large desktops, 1200px and up) */
    @media (min-width: 1200px) {
      .about h1{
        font-size: 3rem;
      }
      .how-to-use h2{ 
        font-size: 2.25rem;
      }
    }
    

  </style>

</head>

<body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: #2c3e50 !important">
    <div class="container">
      <a class="navbar-brand" href="index.html" style="font-weight: bold;">Seleção de Projeto - Yabá Consultoria</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              USUÁRIO
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-login">Login</a>
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-register">Registrar-se</a>
            </div>
          </li>          
        </ul>        
      </div>
    </div>
  </nav>

  <header>
    <div class="d-flex flex-row justify-content-center">
      <img src="/images/bg-header.jpg" class="img-fluid" alt="Responsive image" style="width: 100vw">
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <section class="about mt-5">
      <h1><i class="fas fa-door-open mx-2"></i> bem vindo!</br>Plataforma Digital de Curadoria da Yabá<hr></h1>
      <div class="about-content">
        <p>
          Essa plataforma foi desenvolvida para apoiar o Comitê de Sustentabilidade da Leroy Merlin a selecionar os projetos que serão incentivados via dedução do Imposto de Renda em 2020, facilitando todo o processo de tomada de decisão para o aporte financeiro dos projetos selecionados.       
        </p>
        <p>
          São 4 categorias: 
          <ul>
            <li>Fundo da Criança e do Adolescente</li>
            <li>Fundo do Idoso</li>
            <li>Lei de Incentivo ao Esporte</li>
            <li>Lei de Incentivo à Cultura</li>
          </ul>
        </p>
        <p>  
          Desenvolvida pensando na melhor experiência do usuário, a plataforma conta com um template moderno, intuitivo e responsivo. Veja abaixo como utilizar sua funcionalidades.
        </p>
      </div>
      <!-- Marketing Icons Section -->
      <div class="row">
        <div class="col-12">
          
        </div>
      </div>
    </section>
    <!-- /.row --> 

    <!-- How To Use Section -->
    <section class="how-to-use mt-5">
      <div class="row">
        <div class="col-12">
          <h2><i class="fas fa-sitemap mx-2"></i> Como Utilizar<hr></h2>

          <div class="how-to-use-content">
            <p>Para acessar o painel com as categorias disponpiveis ao Comitê, o usuário precisa apenas se cadastrar informando <b>Nome*</b> e <b>E-mail*</b>.</p>
            <p>Após acessar o painel o usuário pode:</p>
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
                <img class="img-thumbnail" src="/images/how-to-use/img-1.png" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="img-thumbnail" src="/images/how-to-use/img-2.png" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="img-thumbnail" src="/images/how-to-use/img-3.png" alt="Third slide">
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
    <!-- /.row -->   

    <!-- Call to Action Section -->
    <div class="row mt-5">
      <div class="col-12">
        <h5 class="font-weight-bold">Comece agora essa nova experência!</h5>
        <p>Realize seu cadastro e acesso o painel junto com seu time para obterem a melhor tomada de decisão e resultados incríveis.</p>
      </div>
    </div>

    <div class="d-flex flex-row justify-content-center mt-3">      
      <a class="btn btn-lg btn-warning mx-2 p-2 text-white font-weight-bold" href="#" data-toggle="modal" data-target="#modal-register">Cadastrar-se</a>
      <a class="btn btn-lg btn-dark mx-2 p-2 font-weight-bold" href="#" data-toggle="modal" data-target="#modal-login">Entrar</a>      
    </div>

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark mt-5">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Yabá Consultoria 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <c:import url="/WEB-INF/views/componentes/modal/modal-login.jsp" />
  <c:import url="/WEB-INF/views/componentes/modal/modal-register.jsp" /> 
  <c:import url="/WEB-INF/views/componentes/modal/modal-alert-cadastro-usuario.jsp"/>
  <c:import url="/WEB-INF/views/componentes/modal/modal-alert-login.jsp" />

  
  <!-- Bootstrap core JavaScript -->
  <script src="${context}/home/vendor/jquery/jquery.min.js"></script>
  <script src="${context}/home/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <c:if test = "${not empty registerSuccess or not empty registerDanger}">
    <script type="text/javascript">
      $(document).ready(function () {
        $('#modal-alert-cadastro-usuario').modal('show');
      });
    </script>
  </c:if>
  <c:if test = "${loginIncorrect}">
    <script type="text/javascript">
      $(document).ready(function () {
        $('#modal-alert-login').modal('show');
      });
    </script>
  </c:if>

</body>

</html>
