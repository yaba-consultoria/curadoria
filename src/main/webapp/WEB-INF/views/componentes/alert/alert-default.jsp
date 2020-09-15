<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Alert Success -->
<c:if test = "${not empty success}">
	<c:import url="/WEB-INF/views/componentes/alert/alert-success.jsp" />
</c:if>

<!-- Alert Warning -->
<c:if test = "${not empty warning}">
	<c:import url="/WEB-INF/views/componentes/alert/alert-warning.jsp" />
</c:if>

<!-- Alert Danger -->
<c:if test = "${not empty danger}">
	<c:import url="/WEB-INF/views/componentes/alert/alert-danger.jsp" />
</c:if>

<!-- Alert Danger -->
<c:if test = "${not empty info}">
	<c:import url="/WEB-INF/views/componentes/alert/alert-info.jsp" />
</c:if>
