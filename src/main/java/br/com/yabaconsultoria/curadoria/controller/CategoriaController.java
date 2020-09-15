package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.enumerated.StatusCampanha;
import br.com.yabaconsultoria.curadoria.enumerated.StatusCategoria;
import br.com.yabaconsultoria.curadoria.handler.HandlerException;
import br.com.yabaconsultoria.curadoria.model.Campanha;
import br.com.yabaconsultoria.curadoria.model.Categoria;
import br.com.yabaconsultoria.curadoria.model.Projeto;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Classe controller de Categoria
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Controller
public class CategoriaController {

    private final CategoriaService categoriaService;
    private final CampanhaService campanhaService;
    private final ProjetoService projetoService;
    private final VotoService votoService;
    private final UsuarioService usuarioService;
    private final HandlerException handlerException;
    private final SessionService sessionService;

    @Autowired
    public CategoriaController(CategoriaService categoriaService, CampanhaService campanhaService, ProjetoService projetoService, VotoService votoService, UsuarioService usuarioService, HandlerException handlerException, SessionService sessionService) {
        this.categoriaService = categoriaService;
        this.campanhaService = campanhaService;
        this.projetoService = projetoService;
        this.votoService = votoService;
        this.usuarioService = usuarioService;
        this.handlerException = handlerException;
        this.sessionService = sessionService;
    }

    /**
     * Método que realizada chama post para persistir a categoria e uma campanha
     *
     * @param campanhaId         Código identificador da campanha
     * @param categoria          Categoria que será persistida
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página da visualização campanha da categoria
     */
    @PostMapping("/dashboard/campanhas/{campanhaId}/categorias/cadastro")
    public String postSave(@PathVariable Long campanhaId, Categoria categoria, RedirectAttributes redirectAttributes) {
        try {
            categoria = this.categoriaService.save(categoria);
            Campanha campanha = this.campanhaService.findById(campanhaId);
            this.campanhaService.addCategoria(campanha, categoria);
            redirectAttributes.addFlashAttribute("success", "Categoria adicionada com sucesso!");
        } catch (Exception ex) {
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
        }
        return String.format("redirect:/dashboard/campanhas/%d", campanhaId);
    }

    /**
     * Exibe a página da categoria participante da campanha
     *
     * @param campanhaId  Código identificador da campanha
     * @param categoriaId Código identificador da categoria
     * @param request     Objeto que contém informações da requisição
     * @param model       Objeto que atribui informações para a view
     * @return Retorna a página de visualização da categoria
     */
    @GetMapping("/dashboard/campanhas/{campanhaId}/categorias/{categoriaId}")
    public String getFindById(@PathVariable Long campanhaId, @PathVariable Long categoriaId, HttpServletRequest request, Model model) {

        Campanha campanha = this.campanhaService.findById(campanhaId);
        model.addAttribute("campanha", campanha);

        Categoria categoria = categoriaService.findById(categoriaId);

        Usuario usuarioLogado = this.sessionService.getUserLogged(request);
        if (!usuarioLogado.getAdmin()) {
            long votosDisponiveis = (3 - this.votoService.countByUsuarioAndCategoria(usuarioLogado, categoria));
            this.sessionService.updateVotes(request, votosDisponiveis);
            if (votosDisponiveis == 0) {
                model.addAttribute("info", "Você ja possui 3 votos utilizados.");
            }
        }

        // Lista de projeto adicionado ao model de indicação de projetos para a categoria
        List<Projeto> projetos = this.projetoService.findAll();
        model.addAttribute("projetos", projetos);

        // Lista de status de categoria para modal de alterar status da categoria
        StatusCategoria[] statusCategoria = StatusCategoria.values();
        model.addAttribute("statusCategoria", statusCategoria);

        // Seta os projetos elegíveis para votação do usuário logado
        this.votoService.filterProjetosForUser(usuarioLogado, categoria);
        model.addAttribute("categoria", categoria);

        return "dashboard/categorias/visualizar-categoria";
    }

    /**
     * Método que faz a chamada post para alterar o status da categoria
     *
     * @param campanhaId         Código identificadorda campanha
     * @param categoriaId        Código identificar da categoria
     * @param status             Novo status que será atualizado
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página de visualização da categoria
     */
    @PostMapping("/dashboard/campanhas/{campanhaId}/categorias/{categoriaId}/status")
    public String postUpdateStatus(@PathVariable Long campanhaId, @PathVariable Long categoriaId, @RequestParam StatusCategoria status, RedirectAttributes redirectAttributes) {
        try {
            Categoria categoria = this.categoriaService.findById(categoriaId);
            this.categoriaService.updateStatus(categoria, status);
            if (categoria.getStatus() == StatusCategoria.ABERTO) {
                this.campanhaService.updateStatus(categoria.getCampanha(), StatusCampanha.ABERTO);
            }
            redirectAttributes.addFlashAttribute("success", "Status da categoria alterado com sucesso!");
        } catch (Exception ex) {
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
        }
        return String.format("redirect:/dashboard/campanhas/%d/categorias/%d", campanhaId, categoriaId);
    }

    /**
     * Método que realiza a chamada post para indicar projetos para a categoria
     *
     * @param campanhaId         Código identificadorda campanha
     * @param categoriaId        Código identificar da categoria
     * @param projetos           Lista de projetos que serão indicados para a categoria
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página de visualização da categoria
     */
    @PostMapping("/dashboard/campanhas/{campanhaId}/categorias/{categoriaId}/projetos/indicar")
    public String postAddProjeto(@PathVariable Long campanhaId, @PathVariable Long categoriaId, @RequestParam List<Projeto> projetos, RedirectAttributes redirectAttributes) {
        try {
            Categoria categoria = this.categoriaService.findById(categoriaId);
            this.categoriaService.addProjetos(categoria, projetos);
            redirectAttributes.addFlashAttribute("success", "Projeto(s) adicionados à categoria com sucess!");
        } catch (Exception ex) {
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
        }
        return String.format("redirect:/dashboard/campanhas/%d/categorias/%d", campanhaId, categoriaId);
    }

    /**
     * Método que faz a chamada para deletar o projeto da categoria
     *
     * @param campanhaId         Código identificadorda campanha
     * @param categoriaId        Código identificar da categoria
     * @param projetoId          Código identificador do projeto
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página de visualização da categoria
     */
    @GetMapping("/dashboard/campanhas/{campanhaId}/categorias/{categoriaId}/projetos/{projetoId}/excluir")
    @Transactional
    public String getRemoveProjeto(@PathVariable Long campanhaId, @PathVariable Long categoriaId, @PathVariable Long projetoId, RedirectAttributes redirectAttributes) {
        try {
            Categoria categoria = this.categoriaService.findById(categoriaId);
            Projeto projeto = this.projetoService.findById(projetoId);
            // Deleta os votos do projeto na categoria visualizada
            this.votoService.deleteByCategoriaAndProjeto(categoria, projeto);
            // Remove o projeto da categoria
            this.categoriaService.removeProjeto(categoria, projeto);
            redirectAttributes.addFlashAttribute("success", "Projeto removido da categoria com sucesso!");
        } catch (Exception ex) {
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
        }
        return String.format("redirect:/dashboard/campanhas/%d/categorias/%d", campanhaId, categoriaId);
    }

    /**
     * Método que faz a chamada para deletar a categoria da campanha
     *
     * @param campanhaId         Código identificadorda campanha
     * @param categoriaId        Código identificar da categoria
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página de visualização da ´campanha
     */
    @GetMapping("/dashboard/campanhas/{campanhaId}/categorias/{categoriaId}/excluir")
    public String getDeleteById(@PathVariable Long campanhaId, @PathVariable Long categoriaId, RedirectAttributes redirectAttributes) {
        try {
            Campanha campanha = this.campanhaService.findById(campanhaId);
            Categoria categoria = this.categoriaService.findById(categoriaId);
            // Remove a categoria da campanha
            this.campanhaService.removeCategoria(campanha, categoria);
            this.categoriaService.delete(categoria);
            // Atualiza o status da campanha para CRIADO caso não tenha categoria cadastrada
            if (campanha.getCategorias().size() == 0) {
                this.campanhaService.updateStatus(campanha, StatusCampanha.CRIADO);
            }
            redirectAttributes.addFlashAttribute("success", "Categoria removida com sucesso!");
        } catch (Exception ex) {
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
        }
        return String.format("redirect:/dashboard/campanhas/%d/", campanhaId);
    }

    /**
     * Exibe os resultados da categoria
     *
     * @param campanhaId  Código identificadorda campanha
     * @param categoriaId Código identificar da categoria
     * @param model       Objeto que atribui informações para a view
     * @return Retorna a página de visualização dos resultados da categoria
     */
    @GetMapping("/dashboard/campanhas/{campanhaId}/categorias/{categoriaId}/resultados")
    public String getResults(@PathVariable Long campanhaId, @PathVariable Long categoriaId, Model model) {
        Campanha campanha = this.campanhaService.findById(campanhaId);
        model.addAttribute("campanha", campanha);

        Categoria categoria = this.categoriaService.findById(categoriaId);
        model.addAttribute("categoria", categoria);

        Long totalUsuarios = this.usuarioService.count(campanha.getEmpresa());
        model.addAttribute("totalUsuarios", totalUsuarios);

        Long totalVotos = this.votoService.countByCategoria(categoria);
        model.addAttribute("totalVotos", totalVotos);

        Long totalUsuariosWithVoto = this.votoService.countUsuariosWithVoto(categoria);
        model.addAttribute("totalUsuariosWithVoto", totalUsuariosWithVoto);

        List<Projeto> rankingProjetos = votoService.getRankingCategoria(categoria);
        model.addAttribute("rankingProjetos", rankingProjetos);

        return "dashboard/categorias/visualizar-resultados";
    }
}
