<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="modal-cadastro-campanha" class="modal fade">
    <div class="modal-dialog modal-dialog-centered modal-custom">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Nova Categoria</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="${context}/dashboard/campanhas/cadastro" method="post">
                    <div class="form-group">
                        <label for="nome-campanha">Nome da Campanha:</label>
                        <input type="text" class="form-control" id="nome-campanha" name="nome" required>
                    </div>
                    <div class="form-group">
                        <label for="empresa">Empresa:</label>
                        <select class="form-control" id="empresa" name="empresa">
                            <c:forEach var="empresa" items="${empresas}">
                                <option value="${empresa.id}">${empresa.nome}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Cadastrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>     