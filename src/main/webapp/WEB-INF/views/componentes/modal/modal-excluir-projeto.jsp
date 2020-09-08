<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="modal fade" id="modal-excluir-projeto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Você deseja realmente excluir?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Clique em <b>Sim</b> caso deseje realmente excluir o projeto.</div>
            <div class="modal-footer">
            	<form id="formulario-excluir-projeto" action="${context}/dashboard/projetos/excluir/${projeto.id}" method="get">
            		<button type="submit" class="btn btn-primary">Sim</button>
	                <button class="btn btn-secondary" type="button" data-dismiss="modal">Não</button>	                
	            </form>
            </div>
        </div>
    </div>
</div>
