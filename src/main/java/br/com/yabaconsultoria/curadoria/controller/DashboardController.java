package br.com.yabaconsultoria.curadoria.controller;

import br.com.yabaconsultoria.curadoria.enumerated.StatusCategoria;
import br.com.yabaconsultoria.curadoria.handler.HandlerException;
import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Controller responsável pela dashboard
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class DashboardController {

    private SessionService sessionService;
    private ProjetoService projetoService;
    private CampanhaService campanhaService;
    private CategoriaService categoriaService;
    private EmpresaService empresaService;
    private UsuarioService usuarioService;
    private HandlerException handlerException;

    @Autowired
    public DashboardController(SessionService sessionService, ProjetoService projetoService, CampanhaService campanhaService, CategoriaService categoriaService, EmpresaService empresaService, UsuarioService usuarioService, HandlerException handlerException) {
        this.sessionService = sessionService;
        this.projetoService = projetoService;
        this.campanhaService = campanhaService;
        this.categoriaService = categoriaService;
        this.empresaService = empresaService;
        this.usuarioService = usuarioService;
        this.handlerException = handlerException;
    }

    /**
     * Exibe a dashboard para o usuário logado
     *
     * @param model             Objeto que atribui informações para a view
     * @param request           Objeto que contém informações da requisição
     * @param pageableCategoria Objeto que contém atributos de paginação da lista de categorias
     * @return Retorna a página dashboard
     */
    @GetMapping("/dashboard")
    public String getDashboard(Model model, HttpServletRequest request, @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC, size = 5) Pageable pageableCategoria) {
        try {
            Usuario usuario = this.sessionService.getUserLogged(request);
            Empresa empresa = this.empresaService.findByCnpj("01.438.784/0001-05");
            if (usuario != null) {
                if (usuario.getAdmin()) {
                    //Estatisticas
                    model.addAttribute("usuariosLogados", this.usuarioService.count(empresa));
                    model.addAttribute("projetosCadastrados", this.projetoService.count());
                    model.addAttribute("campanhasCadastradas", this.campanhaService.count());
                    model.addAttribute("categoriasCadastradas", this.categoriaService.count());
                }
                model.addAttribute("categoriasAberta", this.categoriaService.findAllByCampanhaEmpresaAndStatus(empresa, StatusCategoria.ABERTO, pageableCategoria));
                model.addAttribute("categoriasFechada", this.categoriaService.findAllByCampanhaEmpresaAndStatus(empresa, StatusCategoria.FECHADO, pageableCategoria));
                model.addAttribute("totalUsuariosEmpresa", this.usuarioService.count(empresa));
            }
        } catch (Exception ex) {
            model.addAttribute("alertCenter", this.handlerException.buildMessage(ex));
        }
        return "dashboard/index";
    }
}
