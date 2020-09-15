<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="pt-br" style="margin: 0; padding: 0;">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Sessão Expirada</title>
  <!-- favicon -->
  <link rel="shortcut icon" href="/images/favicon.png" type="image/x-icon">

  <!-- Bootstrap core CSS -->
  <link href="${context}/home/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Fontawesome -->
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

  <!-- Custom styles for this template -->
  <link href="${context}/home/css/modern-business.css" rel="stylesheet">

</head>

<body style="background:linear-gradient(0deg, rgba(231, 76, 60, 0.3), rgba(231, 76, 60, 0.3)), url(https://colegiobelasartes.com/wp-content/uploads/2014/10/BG.jpg); background-size: cover;">

	<div class="container-fluid d-flex justify-content-center align-items-center" style="height: 80vh">
		<div class="card border-danger">
		  <div class="card-header border-danger">
		  	<h1 class="text-center text-danger">Sessão Expirada</h1>
		  </div>
          <div class="card-body m-3">
          	<p>Sua sessão foi finalizada devido ao tempo de inatividade.</p>
          	<p>Clique no botão abaixo para acessar ao painel novamente.</p>
          	<center><a href="${context}/" class="btn btn-danger mt-3">Home</a></center>
          </div>
      </div>
	</div>

</body>

</html>