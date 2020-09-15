<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!-- Modal HTML -->
<div id="modal-cadastro-categoria-campanha" class="modal fade">
    <div class="modal-dialog modal-dialog-centered modal-custom">
        <div class="modal-content">
            <div class="modal-header">                              
                <h4 class="modal-title">Nova Categoria</h4>   
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="${context}/dashboard/campanhas/${campanha.id}/categorias/cadastro" method="post">
                    <input type="hidden" name="campanha" value="${campanha.id}"> 
                    <div class="form-group">
                        <label>Campanha:</label>
                        <input type="text" class="form-control" value="${campanha.nome}" readonly required="required">     
                    </div>
                    <div class="form-group">
                        <label>Selecione a categoria:</label>
                        <select class="form-control" name="tipo">
                            <c:forEach var="tipo" items="${tipoCategoria}">
                                <option value="${tipo}">${tipo.descricao}</option>
                            </c:forEach>
                        </select> 
                    </div>
                    <div class="form-group">
                        <label>Selecione os projetos participantes:</label>
                        <select class="selectpicker form-control" name="projetos" multiple title="Selecione ..." data-live-search="true" required>
                            <c:forEach var="projeto" items="${projetos}">
                                <option value="${projeto.id}">${projeto.titulo}</option>
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