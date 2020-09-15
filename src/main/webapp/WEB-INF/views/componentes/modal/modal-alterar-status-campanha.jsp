<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!-- Modal HTML -->
<div id="modal-alterar-status-campanha" class="modal fade">
    <div class="modal-dialog modal-dialog-centered modal-custom">
        <div class="modal-content">
            <div class="modal-header">                              
                <h4 class="modal-title">Alterar Status Campanha</h4>   
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="${context}/dashboard/campanhas/${campanha.id}/status" method="post">
                    <div class="form-group">
                        <select class="form-control" name="status">
                            <c:forEach var="status" items="${statusCampanha}">
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