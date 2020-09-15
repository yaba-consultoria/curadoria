package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.handler.HandlerException;
import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.service.EmpresaService;
import br.com.yabaconsultoria.curadoria.service.SessionService;
import br.com.yabaconsultoria.curadoria.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Controller responsável pela autenticação do usuário
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class AuthController {

    private UsuarioService usuarioService;
    private SessionService sessionService;
    private EmpresaService empresaService;
    private HandlerException handlerException;

    @Autowired
    public AuthController(UsuarioService usuarioService, SessionService sessionService, EmpresaService empresaService, HandlerException handlerException) {
        this.usuarioService = usuarioService;
        this.sessionService = sessionService;
        this.empresaService = empresaService;
        this.handlerException = handlerException;
    }

    /**
     * Realiza o cadastro do usuário
     *
     * @param usuario            Usuário que será persistido
     * @param cnpj               Cnpj da empresa que o usuário pertence
     * @param redirectAttributes Objeto que contém mensagens de notificação
     * @return Retorna para página inicial
     */
    @PostMapping("/register")
    public String postRegister(Usuario usuario, @RequestParam String cnpj, RedirectAttributes redirectAttributes) {
        try {
            Empresa empresa = empresaService.findByCnpj(cnpj);
            this.usuarioService.save(usuario, empresa);
            // Dispara modal de usuário cadastrado com sucesso
            redirectAttributes.addFlashAttribute("registerSuccess", "Usuário cadatsrado com sucesso!");
        } catch (Exception ex) {
            // Dispara modal de exception ao cadastrar usuário
            redirectAttributes.addFlashAttribute("registerDanger", handlerException.buildMessage(ex));
        }
        return "redirect:/";
    }

    /**
     * Realiza autenticação do usuário para acessar dashboard
     *
     * @param email              E-mail único do usuário que está acessando a plataforma
     * @param session            Objeto que controla sessão do usuário autenticado
     * @param redirectAttributes Objeto que contém mensagens de notificação
     * @return Retorna para página dashboard
     */
    @PostMapping("/login")
    public String postLogin(@RequestParam String email, HttpSession session, RedirectAttributes redirectAttributes) {
        boolean userExists = usuarioService.existsByEmail(email);
        try {
            if (userExists) {
                Usuario usuario = usuarioService.findByEmail(email);
                this.sessionService.register(session, usuario);
                return "redirect:/dashboard";
            } else {
                // Dispara modal de login incorreto
                redirectAttributes.addFlashAttribute("loginIncorrect", true);
                return "redirect:/";
            }
        } catch (Exception ex) {
            // Dispara modal de exception ao efetuar login
            redirectAttributes.addFlashAttribute("loginIncorrect", handlerException.buildMessage(ex));
            return "redirect:/";
        }
    }

    /**
     * Realiza o logoff do usuário
     *
     * @param request Objeto que contém informações da requisição do usuário
     * @return Retorna para página inicial
     */
    @GetMapping("/logout")
    public String getLogout(HttpServletRequest request) {
        this.sessionService.logout(request);
        return "redirect:/";
    }

    /**
     * Exibe página de sessão expirada quando Interceptor não localiza o usuário na sessão atual
     *
     * @return Retorna página de sessão expirada
     */
    @GetMapping("/sessao-expirada")
    public String getSessionExpired() {
        return "home/sessao-expirada";
    }
}
