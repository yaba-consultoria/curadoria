package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.handler.HandlerException;
import br.com.yabaconsultoria.curadoria.model.Projeto;
import br.com.yabaconsultoria.curadoria.service.ProjetoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Classe controller de projetos
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 03/09/2020
 */
@Controller
@Slf4j
public class ProjetosController {

    private final ProjetoService projetoService;
    private final HandlerException handlerException;

    @Autowired
    public ProjetosController(ProjetoService projetoService, HandlerException handlerException) {
        this.projetoService = projetoService;
        this.handlerException = handlerException;
    }

    /**
     * Método que recebe a chama post para salvar um projeto
     *
     * @param request            Objeto que possui informações da requisição
     * @param projeto            Projeto que será persistido
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página que lista os projetos cadastrados
     */
    @PostMapping("/dashboard/projetos/cadastro")
    public String postSave(HttpServletRequest request, Projeto projeto, final RedirectAttributes redirectAttributes) {
        try {
            projeto = this.projetoService.save(projeto);
            this.projetoService.uploadFile(request, projeto);
            redirectAttributes.addFlashAttribute("success", "Projeto adicionado com sucesso.");
        } catch (Exception ex) {
            log.error("Falha ao cadastrar o projeto {}", projeto.getTitulo());
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
        }
        return "redirect:/dashboard/projetos";
    }

    /**
     * Exibe a página de visualização das informações do projeto localizado pelo código identificador
     *
     * @param projetoId Código identificador do projeto
     * @param model     Objeto que atribui informações para a view
     * @return Retorna a página com as informações do projeto localizado
     */
    @GetMapping("/dashboard/projetos/{projetoId}")
    public String getFindById(@PathVariable Long projetoId, Model model) {
        Projeto projeto = projetoService.findById(projetoId);
        model.addAttribute("projeto", projeto);
        return "dashboard/projetos/visualizar-projeto";
    }

    /**
     * Exibe a página com a lista dos projeto cadastrados
     *
     * @param model    Objeto que atribui informações para a view
     * @param pageable Objeto que contém informações de paginação
     * @param page     Parâmetro que informa o nº da página de projetos que deseja ser exibida
     * @param titulo   Parâmetro que informa caracteres que deseja filtrar na pesquisa de projetos
     * @return Retorna a página de projetos cadastrados
     */
    @GetMapping("/dashboard/projetos")
    public String getFindAll(Model model, @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable, @RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false, defaultValue = "") String titulo) {
        Page<Projeto> projetos;
        if (titulo.equals("")) {
            projetos = this.projetoService.findAll(pageable);
        } else {
            projetos = this.projetoService.findAllByTituloContaining(pageable, titulo);
        }
        model.addAttribute("projetos", projetos);
        return "dashboard/projetos/lista-projetos";
    }

    /**
     * Método que faz a chamada para deletar um projeto por código identificador
     *
     * @param projectId          Código identificador do projeto
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página de projetos cadastrados
     */
    @GetMapping("/dashboard/projetos/excluir/{projectId}")
    public String getDeleteById(@PathVariable Long projectId, final RedirectAttributes redirectAttributes) {
        try {
            Projeto projeto = this.projetoService.findById(projectId);
            this.projetoService.deleteById(projeto);
            redirectAttributes.addFlashAttribute("success", "Projeto excluído com sucesso!");
        } catch (Exception ex) {
            log.error("Falha ao excluir o projeto #{}.", projectId);
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
        }
        return "redirect:/dashboard/projetos";
    }
}
