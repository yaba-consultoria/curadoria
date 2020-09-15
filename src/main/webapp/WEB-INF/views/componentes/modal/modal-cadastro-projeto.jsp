<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal HTML -->
<div id="modal-cadastro-projeto" class="modal fade">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-custom">
        <div class="modal-content">
            <div class="modal-header">                              
                <h4 class="modal-title">Novo Projeto</h4>   
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <form action="${context}/dashboard/projetos/cadastro" method="post" enctype="multipart/form-data" acceptcharset="UTF-8">
                <div class="modal-body">      
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label>Foto do Projeto:</label>                                
                                <div class="custom-file">
                                  <input type="file" class="custom-file-input" name="logo.anexo" id="img-input" required>
                                  <input type="hidden" name="logo.tipo" value="LOGO">   
                                  <label class="custom-file-label" for="customFile">Selecione o arquivo: (png, jpg, jpeg, bitmap)</label>
                                </div>
                            </div>
                        </div>
                    </div>       
                    <div class="d-flex flex-row justify-content-center my-2">
                        <div class="col-12">
                            <center>
                                <img class="img-thumbnail" id="img-preview" src="https://baladasegura.rs.gov.br/themes/modelo-institucional/images/outros/GD_imgSemImagem.png" alt="image preview"/ style="max-height: 300px;">
                            </center>
                        </div>
                    </div>                       
                    <div class="row mt-5">
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label>Título:</label>
                                <input type="text" class="form-control" name="titulo" placeholder="Nome do Projeto" required>     
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label>Proponente:</label>
                                <input type="text" class="form-control" name="proponente" placeholder="Proponente" required> 
                            </div> 
                        </div>  
                    </div>

                    <div class="row">
                        <div class="col-md-8 col-12">
                            <div class="form-group">
                                <label>Cidade:</label>
                                <input type="text" class="form-control" name="localidade.cidade" placeholder="Cidade" required>     
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label>Estado:</label>
                                <select class="form-control" name="localidade.estado" required>
                                    <option value="AC">Acre</option>
                                    <option value="AL">Alagoas</option>
                                    <option value="AP">Amapá</option>
                                    <option value="AM">Amazonas</option>
                                    <option value="BA">Bahia</option>
                                    <option value="CE">Ceará</option>
                                    <option value="DF">Distrito Federal</option>
                                    <option value="ES">Espírito Santo</option>
                                    <option value="GO">Goiás</option>
                                    <option value="MA">Maranhão</option>
                                    <option value="MT">Mato Grosso</option>
                                    <option value="MS">Mato Grosso do Sul</option>
                                    <option value="MG">Minas Gerais</option>
                                    <option value="PA">Pará</option>
                                    <option value="PB">Paraíba</option>
                                    <option value="PR">Paraná</option>
                                    <option value="PE">Pernambuco</option>
                                    <option value="PI">Piauí</option>
                                    <option value="RJ">Rio de Janeiro</option>
                                    <option value="RN">Rio Grande do Norte</option>
                                    <option value="RS">Rio Grande do Sul</option>
                                    <option value="RO">Rondônia</option>
                                    <option value="RR">Roraima</option>
                                    <option value="SC">Santa Catarina</option>
                                    <option value="SP">São Paulo</option>
                                    <option value="SE">Sergipe</option>
                                    <option value="TO">Tocantins</option>
                                </select>  
                            </div>
                        </div>  
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="parceiros">Parceiros:</label></br>
                                <input type="text" class="form-control" name="parceiros" data-role="tagsinput">
                            </div>
                        </div>
                    </div>     

                    <div class="row">
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label>Beneficiários Direto:</label>
                                <input type="number" class="form-control" name="beneficiariosDireto" placeholder="Qtd. Beneficiários Direto" required>     
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label>Beneficiários Indireto:</label>
                                <input type="number" class="form-control" name="beneficiariosIndireto" placeholder="Qtd. Beneficiários Indireto" required> 
                            </div> 
                        </div>  
                    </div>

                    <div class="row">
                         <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label>Valor Solicitado:</label>
                                <input type="text" class="form-control" name="valorSolicitado" id="valorSolicitado" placeholder="R$ 100.000,00" required> 
                            </div> 
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="form-group">
                                <label>Valor Total:</label>
                                <input type="text" class="form-control" name="valorTotal" id="valorTotal" placeholder="R$ 500.000,00" required> 
                            </div> 
                        </div>  
                    </div>

                    <div class="row">      
                        <div class="col-12">    
                             <div class="form-group">
                                <label>Resumo:</label>
                                <textarea class="form-control" name="resumo" rows="5" placeholder="Escreva o resumo do projeto em até 2.500 caracteres" maxlength="2500" required></textarea>
                            </div>   
                        </div>
                    </div>  

                    <fieldset>
                        <legend>Análise:</legend>
                        <div class="row">
                            <div class="col-md-6 col-12">    
                                 <div class="form-group">
                                    <label>Engajamento com Stakeholders:</label>
                                    <div class="rating">
                                        <input type="radio" name="analise.engajamentoStakeHolders" value="BOM" id="analise-engajamento-stakeholders-bom"><label for="analise-engajamento-stakeholders-bom" title="Bom">☆</label>
                                        <input type="radio" name="analise.engajamentoStakeHolders" value="MEDIO" id="analise-engajamento-stakeholders-medio"><label for="analise-engajamento-stakeholders-medio" title="Médio">☆</label>
                                        <input type="radio" name="analise.engajamentoStakeHolders" value="RUIM" id="analise-engajamento-stakeholders-ruim" checked><label for="analise-engajamento-stakeholders-ruim" title="Ruim" >☆</label>
                                    </div>
                                </div>   
                            </div>                              
                            <div class="col-md-6 col-12">    
                                 <div class="form-group">
                                    <label>Alinhamento do Negócio:</label>
                                    <div class="rating">
                                        <input type="radio" name="analise.alinhamentoNegocios" value="BOM" id="analise.alinhamento-negocios-bom"><label for="analise.alinhamento-negocios-bom" title="Bom">☆</label>
                                        <input type="radio" name="analise.alinhamentoNegocios" value="MEDIO" id="analise.alinhamento-negocios-medio"><label for="analise.alinhamento-negocios-medio" title="Médio">☆</label>
                                        <input type="radio" name="analise.alinhamentoNegocios" value="RUIM" id="analise.alinhamento-negocios-ruim" checked><label for="analise.alinhamento-negocios-ruim" title="Ruim">☆</label>
                                    </div>
                                </div>   
                            </div> 
                            <div class="col-md-6 col-12">    
                                 <div class="form-group">
                                    <label>Visibilidade:</label>
                                    <div class="rating">
                                        <input type="radio" name="analise.visibilidade" value="BOM" id="analise-visibilidade-bom"><label for="analise-visibilidade-bom" title="Bom">☆</label>
                                        <input type="radio" name="analise.visibilidade" value="MEDIO" id="analise-visibilidade-medio"><label for="analise-visibilidade-medio" title="Médio">☆</label>
                                        <input type="radio" name="analise.visibilidade" value="RUIM" id="analise-visibilidade-ruim" checked><label for="analise-visibilidade-ruim" title="Ruim">☆</label>
                                    </div>
                                </div>   
                            </div>
                        </div>  
                    </fieldset> 
                </div>
                <div class="modal-footer">
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Cadastrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>     