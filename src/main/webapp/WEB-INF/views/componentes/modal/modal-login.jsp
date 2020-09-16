<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="modal-login" class="modal fade">
    <div class="modal-dialog modal-dialog-centered modal-custom">
        <div class="modal-content">
            <div class="modal-header">
                <div class="avatar">
                    <i class="fas fa-user-shield"></i>
                </div>
                <h4 class="modal-title">Acesso Restrito</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="${context}/login" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="email" placeholder="E-mail" required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>     