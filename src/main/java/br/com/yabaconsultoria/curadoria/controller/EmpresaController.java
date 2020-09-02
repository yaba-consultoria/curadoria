package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.service.EmpresaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class EmpresaController {

    private EmpresaService empresaService;

    @Autowired
    public EmpresaController(EmpresaService empresaService) {
        this.empresaService = empresaService;
    }

    @GetMapping("/dashboard/empresas")
    public String getListAll(Model model){
        List<Empresa> empresaList = empresaService.findAll();
        model.addAttribute("empresas", empresaList);
        return "dashboard/empresas/lista-empresas";
    }
}
