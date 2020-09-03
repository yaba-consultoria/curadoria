package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.handler.ErrorMessageHandler;
import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.service.EmpresaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.List;
import java.util.Set;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class EmpresaController {

    private EmpresaService empresaService;
    private ErrorMessageHandler errorMessageHandler;

    @Autowired
    public EmpresaController(EmpresaService empresaService, ErrorMessageHandler errorMessageHandler) {
        this.empresaService = empresaService;
        this.errorMessageHandler = errorMessageHandler;
    }

    @PostMapping("/dashboard/empresas/cadastro")
    public String save(Empresa empresa, final RedirectAttributes redirectAttributes){
        try {
            this.empresaService.save(empresa);
            redirectAttributes.addFlashAttribute("success", "Empresa adicionada com sucesso.");
        } catch (ConstraintViolationException ex){
            StringBuilder message = errorMessageHandler.buildConstraintViolationMessage(ex);
            redirectAttributes.addFlashAttribute("danger", "Falha ao cadastrar empresa.<br>" + message);
        }
        return "redirect:/dashboard/empresas";
    }

    @GetMapping("/dashboard/empresas")
    public String getListAll(Model model){
        List<Empresa> empresaList = empresaService.findAll();
        model.addAttribute("empresas", empresaList);
        return "dashboard/empresas/lista-empresas";
    }
}
