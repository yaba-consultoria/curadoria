package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.service.EmpresaService;
import br.com.yabaconsultoria.curadoria.service.SessionService;
import br.com.yabaconsultoria.curadoria.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class AuthController {

    private UsuarioService usuarioService;
    private SessionService sessionService;
    private EmpresaService empresaService;

    @Autowired
    public AuthController(UsuarioService usuarioService, SessionService sessionService, EmpresaService empresaService) {
        this.usuarioService = usuarioService;
        this.sessionService = sessionService;
        this.empresaService = empresaService;
    }

    @PostMapping("/register")
    public String register(Usuario usuario, @RequestParam String cnpj){
        System.out.println(usuario);
        boolean exists = usuarioService.existsByEmail(usuario.getEmail());
        if(!exists){
            Empresa empresa = empresaService.getByCnpj(cnpj);
            this.usuarioService.save(usuario, empresa);
        }
        return "redirect:/";
    }

    @PostMapping("/login")
    public String postLogin(@RequestParam String email, @RequestParam String senha, Model model, HttpSession session){
        boolean isLogged = usuarioService.login(email, senha);
        if(isLogged){
            Usuario usuario = usuarioService.findByEmail(email);
            this.sessionService.register(session, usuario);
            return "redirect:/dashboard";
        }
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String getLogout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
}
