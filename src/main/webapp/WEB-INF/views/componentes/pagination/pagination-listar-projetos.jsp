<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<nav class="" aria-label="Paginação de Projetos">
  <ul class="pagination"> 
    <c:choose> 
      <c:when test = "${projetos.totalPages == 1}">
        <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
        <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
        <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
      </c:when>
      <c:when test = "${(projetos.totalPages == 2) && (projetos.number + 1 < projetos.totalPages)}">
        <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
        <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number + 1}&titulo=${titulo}">${projetos.number + 2}</a></li>
        <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
      </c:when>
      <c:when test = "${(projetos.totalPages == 2) && (projetos.number + 1 == projetos.totalPages)}">
        <li class="page-item"><button class="page-link text-primary" disabled>Primeira</button></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number - 1}&titulo=${titulo}">${projetos.number}</a></li>
        <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
        <li class="page-item"><button class="page-link text-primary" disabled>Última</button></li>
      </c:when>
      <c:when test = "${(projetos.totalPages >= 3) && (projetos.number == 0)}">
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?&titulo=${titulo}">Primeira</a></li>
        <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number + 1}&titulo=${titulo}">${projetos.number + 2}</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number + 2}&titulo=${titulo}">${projetos.number + 3}</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.totalPages - 1}&titulo=${titulo}">Última</a></li>
      </c:when>
      <c:when test = "${(projetos.totalPages >= 3) && (projetos.number > 0) && (projetos.number + 1 < projetos.totalPages)}">
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?&titulo=${titulo}">Primeira</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number - 1}&titulo=${titulo}">${projetos.number}</a></li>
        <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number + 1}&titulo=${titulo}">${projetos.number + 2}</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.totalPages - 1}&titulo=${titulo}">Última</a></li>
      </c:when>
      <c:when test = "${(projetos.totalPages >= 3) && (projetos.number + 1 == projetos.totalPages)}">
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?&titulo=${titulo}">Primeira</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number - 2}&titulo=${titulo}">${projetos.number - 1}</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.number - 1}&titulo=${titulo}">${projetos.number}</a></li>
        <li class="page-item active"><a class="page-link text-white" href="${context}/dashboard/projetos?page=${projetos.number}&titulo=${titulo}">${projetos.number + 1}</a></li>
        <li class="page-item"><a class="page-link text-primary" href="${context}/dashboard/projetos?page=${projetos.totalPages - 1}&titulo=${titulo}">Última</a></li>
      </c:when>
    </c:choose> 
  </ul>
</nav>  