package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.enumerated.StatusCategoria;
import br.com.yabaconsultoria.curadoria.handler.HandlerException;
import br.com.yabaconsultoria.curadoria.model.Categoria;
import br.com.yabaconsultoria.curadoria.model.Projeto;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 09/09/2020
 */
@Controller
@Slf4j
public class VotoController {

    private final VotoService votoService;
    private final CategoriaService categoriaService;
    private final ProjetoService projetoService;
    private final SessionService sessionService;
    private final HandlerException handlerException;

    @Autowired
    public VotoController(VotoService votoService, CategoriaService categoriaService, ProjetoService projetoService, SessionService sessionService, HandlerException handlerException) {
        this.votoService = votoService;
        this.categoriaService = categoriaService;
        this.projetoService = projetoService;
        this.sessionService = sessionService;
        this.handlerException = handlerException;
    }

    /**
     * Método que realiza a chamada post para cadastrar um voto em um projeto participante de uma categoria da campanha
     *
     * @param campanhaId         Código identificador da campanha
     * @param categoriaId        Código identificador da categoria
     * @param projetoId          Código identificador do projeto
     * @param request            Objeto que contém informações da requisição do usuário
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página de visualização da categoria
     */
    @PostMapping("/dashboard/campanhas/{campanhaId}/categorias/{categoriaId}/projetos/{projetoId}/votar")
    public String postSave(@PathVariable Long campanhaId, @PathVariable Long categoriaId, @PathVariable Long projetoId, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        Usuario usuarioLogado = this.sessionService.getUserLogged(request);
        try {
            // Verifica se o usuário logado possui votos disponíveis
            if (usuarioLogado.getVotosDisponiveis() > 0) {
                Categoria categoria = this.categoriaService.findById(categoriaId);
                Projeto projeto = this.projetoService.findById(projetoId);
                // Verifica se a categoria esta aberta para votação
                if (categoria.getStatus() == StatusCategoria.ABERTO) {
                    this.votoService.save(categoria, projeto, usuarioLogado);
                    redirectAttributes.addFlashAttribute("success", "Voto computado com sucesso!");
                } else redirectAttributes.addFlashAttribute("#danger", "A votação ja foi encerrada.");
            }
        } catch (Exception ex) {
            log.error(handlerException.buildMessage(ex));
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
        }
        return String.format("redirect:/dashboard/campanhas/%d/categorias/%d", campanhaId, categoriaId);
    }
}
