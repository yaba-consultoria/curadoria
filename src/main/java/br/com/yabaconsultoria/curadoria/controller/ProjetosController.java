package br.com.yabaconsultoria.curadoria.controller;

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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 03/09/2020
 */
@Controller
@Slf4j
public class ProjetosController {

    private ProjetoService projetoService;

    @Autowired
    public ProjetosController(ProjetoService projetoService) {
        this.projetoService = projetoService;
    }

    @PostMapping("/dashboard/projetos/cadastro")
    public String postSave(HttpServletRequest request, Projeto projeto, final RedirectAttributes redirectAttributes){
        try {
            projeto = this.projetoService.save(projeto);
            this.projetoService.upload(request, projeto);
            log.info("Projeto {} cadastrado com sucesso!", projeto.getTitulo());
            redirectAttributes.addFlashAttribute("success", "Projeto adicionado com sucesso.");
        } catch (Exception ex){
            log.error("Falha ao cadastrar o projeto {}", projeto.getTitulo());
            redirectAttributes.addFlashAttribute("danger", "Falha ao cadastrar projeto.</br>" + ex.getMessage());
        }
        return "redirect:/dashboard/projetos";
    }

    @GetMapping("/dashboard/projetos/{projetoId}")
    public String findbYiD(@PathVariable Long projetoId, Model model){
        Projeto projeto = projetoService.findById(projetoId);
        model.addAttribute("projeto", projeto);
        return "dashboard/projetos/visualizar-projeto";
    }

    @GetMapping("/dashboard/projetos")
    public String getFindAll(Model model, @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable, @RequestParam(required = false,defaultValue = "0") int page, @RequestParam(required = false, defaultValue = "") String titulo){
        Page<Projeto> projetos;
        if(titulo.equals("")){
            projetos = this.projetoService.findAll(pageable);
        }
        else{
            projetos = this.projetoService.findAllByTituloContaining(pageable, titulo);
        }
        model.addAttribute("projetos", projetos);
        return "dashboard/projetos/lista-projetos";
    }

    @GetMapping("/dashboard/projetos/excluir/{projectId}")
    public String deleteById(@PathVariable Long projectId, final RedirectAttributes redirectAttributes){
        try {
            Projeto projeto = this.projetoService.findById(projectId);
            this.projetoService.deleteById(projeto);
            log.info("Projeto {} excluído com sucesso!", projeto.getTitulo());
            redirectAttributes.addFlashAttribute("success", "Projeto excluído com sucesso!");
        } catch (Exception ex){
            log.error("Falha ao excluir o projeto.", ex);
            redirectAttributes.addFlashAttribute("danger", "Falha ao exclui projeto.</br>" + ex);
        }
        return "redirect:/dashboard/projetos";
    }
}
