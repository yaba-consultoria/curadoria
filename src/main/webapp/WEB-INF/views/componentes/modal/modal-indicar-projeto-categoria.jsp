<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<div id="modal-indicar-projeto-categoria" class="modal fade">
    <div class="modal-dialog modal-dialog-centered modal-custom">
        <div class="modal-content">
            <div class="modal-header">                              
                <h4 class="modal-title">Indicar Projeto</h4>   
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}/projetos/indicar" method="post">
                    <input type="hidden" name="campanha" value="${campanha.id}"> 
                    <div class="form-group">
                        <label for="campanha">Campanha:</label>
                        <input type="text" class="form-control" id="campanha" value="${campanha.nome}" readonly required="required">
                    </div>
                    <div class="form-group">
                        <label for="categoria">Categoria:</label>
                        <input type="text" class="form-control" id="categoria" value="${categoria.tipo.descricao}" readonly required="required">
                    </div>
                    <div class="form-group">
                        <label for="projetos">Selecione os projetos indicado:</label>
                        <select class="selectpicker form-control" id="projetos" name="projetos" multiple title="Selecione ..." data-live-search="true" required>
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