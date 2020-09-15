<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal HTML -->
<div id="modal-register" class="modal fade">
    <div class="modal-dialog modal-dialog-centered modal-custom">
        <div class="modal-content">
            <div class="modal-header">
                <div class="avatar">
                    <i class="fas fa-user-lock"></i>
                </div>              
                <h4 class="modal-title">Cadastro</h4>   
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="${context}/register" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="nome" placeholder="Nome" required="required">     
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="email" placeholder="E-mail" required="required">     
                    </div>      
                    <div class="form-group">
                        <input type="text" class="form-control" value="Leroy Merlin" placeholder="Empresa" disabled> 
                        <input type="hidden" class="form-control" name="cnpj" value="01.438.784/0001-05" placeholder="Leroy Merlin" required="required"> 
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Registrar-se</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>     