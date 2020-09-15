package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.handler.HandlerException;
import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.service.EmpresaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.ConstraintViolationException;
import java.util.List;

/**
 * Classe controller da empresa
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class EmpresaController {

    private EmpresaService empresaService;
    private HandlerException handlerException;

    @Autowired
    public EmpresaController(EmpresaService empresaService, HandlerException handlerException) {
        this.empresaService = empresaService;
        this.handlerException = handlerException;
    }

    /**
     * Método que realiza a chamada post para cadastrar uma empresa
     *
     * @param empresa            Empresa que será persistida
     * @param redirectAttributes Objeto que adiciona mensagens para a view
     * @return Retorna a página de empresas cadastradas
     */
    @PostMapping("/dashboard/empresas/cadastro")
    public String postSave(Empresa empresa, RedirectAttributes redirectAttributes) {
        try {
            this.empresaService.save(empresa);
            redirectAttributes.addFlashAttribute("success", "Empresa adicionada com sucesso.");
        } catch (ConstraintViolationException ex) {
            redirectAttributes.addFlashAttribute("danger", handlerException.buildMessage(ex));
        }
        return "redirect:/dashboard/empresas";
    }

    /**
     * Método que exibe a view de empresas cadastradas
     *
     * @param model Objeto que atribui informações para a view
     * @return Retorna a página que exibe as empresas cadastradas
     */
    @GetMapping("/dashboard/empresas")
    public String getFindAll(Model model) {
        List<Empresa> empresaList = empresaService.findAll();
        model.addAttribute("empresas", empresaList);
        return "dashboard/empresas/lista-empresas";
    }
}
