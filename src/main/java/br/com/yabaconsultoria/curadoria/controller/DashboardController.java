package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class DashboardController {

    private SessionService sessionService;

    @Autowired
    public DashboardController(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    @GetMapping("/dashboard")
    public String getDashboard(Model model, HttpServletRequest request){
        Usuario usuario = this.sessionService.getUserLogged(request);
        if(usuario != null) {
            if (usuario.getAdmin()) {
                model.addAttribute("usuariosLogados", this.sessionService.getNumbersSessions());
            }
        }
        return "dashboard/index";
    }
}
