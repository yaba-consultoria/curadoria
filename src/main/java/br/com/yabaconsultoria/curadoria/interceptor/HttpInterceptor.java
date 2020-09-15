package br.com.yabaconsultoria.curadoria.interceptor;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Classe responsável por interceptar e autorizar o acesso do usuário a cada requisição
 * Redirecionar para página de sessão expirada, caso não haja uma sessão válida
 * @author Lucas Copque
 * @version 1.0
 * @since 04/09/2020
 */
@CrossOrigin
public class HttpInterceptor extends HandlerInterceptorAdapter {


    /**
     * Método que realiza o papel do filter.
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
            throws Exception {

        // Recebe a URI que esta sendo acessada
        final String uri = request.getRequestURI();

        // URI's permitidas sem sessão
        if (uri.contentEquals("") || uri.contentEquals("/") || uri.contains("/login") || uri.contains("/register") || uri.contains("/sessao-expirada") || uri.contains("/endpoint")) {
            return true;
        }

        // Verifica se a URI é de visualização de arquivo estático
        if (uri.contains("css") || uri.contains("js") || uri.contains("png") || uri.contains("jpg")
                || uri.contains("jpeg") || uri.contains("pdf") || uri.contains("bmp")) {
            return true;
        }

        // Verifica se possui um usuário válido na sessão.
        else if (request.getSession().getAttribute("usuario") != null) {
            return true;
        }

        // Caso não entre em nenhuma situação acima, direciona para a página de sessão
        // expirada ou inválida.
        else {
            request.getSession().invalidate();
            response.sendRedirect("/sessao-expirada");
            return false;
        }
    }

}
