<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="modal-cadastro-empresa" class="modal fade">
    <div class="modal-dialog modal-dialog-centered modal-custom">
        <div class="modal-content">
            <div class="modal-header">                              
                <h4 class="modal-title">Nova Empresa</h4>   
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="${context}/dashboard/empresas/cadastro" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="nome" placeholder="Nome Fantasia" required="required">     
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="cnpj" placeholder="CNPJ" id="cnpj" required="required" onchange="if(!validarCNPJ(this.value)){alert('CNPJ inválido!'); this.value='';}"> 
                    </div>        
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Cadastrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>     