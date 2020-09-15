package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.enumerated.StatusCampanha;
import br.com.yabaconsultoria.curadoria.enumerated.StatusCategoria;
import br.com.yabaconsultoria.curadoria.enumerated.TipoCategoria;
import br.com.yabaconsultoria.curadoria.handler.HandlerException;
import br.com.yabaconsultoria.curadoria.model.Campanha;
import br.com.yabaconsultoria.curadoria.model.Categoria;
import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.model.Projeto;
import br.com.yabaconsultoria.curadoria.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Controller
@Slf4j
public class CampanhasController {

    private final CampanhaService campanhaService;
    private final CategoriaService categoriaService;
    private final EmpresaService empresaService;
    private final ProjetoService projetoService;
    private final VotoService votoService;
    private final HandlerException handlerException;

    @Autowired
    public CampanhasController(CampanhaService campanhaService, CategoriaService categoriaService, EmpresaService empresaService, ProjetoService projetoService, VotoService votoService, HandlerException handlerException) {
        this.campanhaService = campanhaService;
        this.categoriaService = categoriaService;
        this.empresaService = empresaService;
        this.projetoService = projetoService;
        this.votoService = votoService;
        this.handlerException = handlerException;
    }

    /**
     * Método que realiza chamado post para cadastrar uma campanha
     *
     * @param campanha           Campanha que será persistida
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna página de visualização de campanhas cadastradas
     */
    @PostMapping("/dashboard/campanhas/cadastro")
    public String postSave(Campanha campanha, final RedirectAttributes redirectAttributes) {
        try {
            this.campanhaService.save(campanha);
            redirectAttributes.addFlashAttribute("success", "Campanha salva com sucesso.");
        } catch (Exception ex) {
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
            log.error(handlerException.buildMessage(ex));
        }
        return "redirect:/dashboard/campanhas";
    }

    /**
     * Exibe a página de visualização de campanha por código identificador
     *
     * @param campanhaId Código identificador da campanha
     * @param model      Objeto que atribui informações para a view
     * @return Retorna a página que exibe os detalhes da campanha
     */
    @GetMapping("/dashboard/campanhas/{campanhaId}")
    public String getFindById(@PathVariable Long campanhaId, Model model) {
        Campanha campanha = this.campanhaService.findById(campanhaId);
        model.addAttribute("campanha", campanha);

        // Lista de status de campanha para modal de alterar status da campanha
        StatusCampanha[] statusCampanha = StatusCampanha.values();
        model.addAttribute("statusCampanha", statusCampanha);

        // Lista de projeto adicionado ao model de indicação de projetos para a categoria da campanha
        List<Projeto> projetos = this.projetoService.findAll();
        model.addAttribute("projetos", projetos);

        // Lista de tipo de categoria para modal de com tipo da categoria
        TipoCategoria[] tipoCategoria = TipoCategoria.values();
        model.addAttribute("tipoCategoria", tipoCategoria);

        return "dashboard/campanhas/visualizar-campanha";
    }

    /**
     * Método que realiza a chamada post para atualizar o status da campanha
     *
     * @param campanhaId         Código identificador da campanha
     * @param status             Novo status da campanha
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna página de visualização de campanhas visualizada
     */
    @PostMapping("/dashboard/campanhas/{campanhaId}/status")
    public String updateStatus(@PathVariable Long campanhaId, @RequestParam StatusCampanha status, RedirectAttributes redirectAttributes) {
        Campanha campanha = campanhaService.findById(campanhaId);
        this.campanhaService.updateStatus(campanha, status);
        redirectAttributes.addFlashAttribute("success", "Status da campanha alterado com sucesso.");
        return "redirect:/dashboard/campanhas/" + campanha.getId();
    }

    /**
     * Exibe a página de campanhas cadastradas
     *
     * @param model Objeto que atribui informações para a view
     * @return Retorna a página de visualização de campanhas cadastradas
     */
    @GetMapping("/dashboard/campanhas")
    public String getFindAll(Model model) {
        List<Campanha> campanhas = this.campanhaService.findAll();
        model.addAttribute("campanhas", campanhas);

        // Lista de empresas cadastradas para associar a campanha
        List<Empresa> empresas = this.empresaService.findAll();
        model.addAttribute("empresas", empresas);

        return "dashboard/campanhas/lista-campanhas";
    }

    /**
     * Método que realiza a chamada para excluir a campanha por código identificador
     *
     * @param campanhaId         Código identificador da campanha
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página de visualização de campanhas cadastradas
     */
    @Transactional
    @GetMapping("/dashboard/campanhas/{campanhaId}/excluir")
    public String getDelete(@PathVariable Long campanhaId, RedirectAttributes redirectAttributes) {
        try {
            Campanha campanha = this.campanhaService.findById(campanhaId);
            // Verifica se a campanha possui categorias esta em andamento
            if (!campanha.getCategorias().isEmpty()) {
                for (Categoria categoria : campanha.getCategorias()) {
                    if (categoria.getStatus() == StatusCategoria.ABERTO) {
                        redirectAttributes.addFlashAttribute("danger", "Esta campanha possui com categoria(s) em aberto.</br>");
                        return "redirect:/dashboard/campanhas/";
                    }
                }
            }
            // Senão deleta a campanha
            else {
                for (Categoria categoria : campanha.getCategorias()) {
                    // Deleta todos os voto das categoria
                    this.votoService.deleteAllByCategoria(categoria);
                    // Deleta a categoria
                    this.categoriaService.delete(categoria);
                }
                // Deleta a campanha
                this.campanhaService.delete(campanha);
                redirectAttributes.addFlashAttribute("success", "Campanha excluída com sucesso!");
            }
        } catch (Exception ex) {
            redirectAttributes.addFlashAttribute("danger", ex.getClass());
            log.error(handlerException.buildMessage(ex));
            return "redirect:/dashboard/campanhas";
        }
        return "redirect:/dashboard/campanhas";
    }
}
