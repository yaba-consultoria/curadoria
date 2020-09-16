<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<div id="modal-alterar-status-categoria" class="modal fade">
    <div class="modal-dialog modal-dialog-centered modal-custom">
        <div class="modal-content">
            <div class="modal-header">                              
                <h4 class="modal-title">Alterar Status Categoria</h4>   
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="${context}/dashboard/campanhas/${campanha.id}/categorias/${categoria.id}/status" method="post">
                    <div class="form-group">
                        <select class="form-control" name="status">
                            <c:forEach var="status" items="${statusCategoria}">
                                <option value="${status}">${status.descricao}</option>
                            </c:forEach>
                        </select> 
                    </div>    
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Alterar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>     