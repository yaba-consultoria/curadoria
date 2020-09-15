package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.handler.HandlerException;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Classe de serviço que controla a sessão do usuário
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 04/09/2020
 */
@Service
@Slf4j
public class SessionService {

    private HandlerException handlerException;

    @Autowired
    public SessionService(HandlerException handlerException) {
        this.handlerException = handlerException;
    }

    /**
     * Método que registra a sessão do usuário logado
     *
     * @param session Objeto que contém informações da sessão
     * @param usuario Usuário que será controlado na sessão
     */
    public synchronized void register(HttpSession session, Usuario usuario) {
        session.setAttribute("usuario", usuario);
        log.info("Sessão iniciada para usuario {}", usuario.getEmail());
    }

    /**
     * Método que atualiza a quantidade de votos disponíveis na sessão do usuário para utilizar na categoria visualizada
     *
     * @param request Objeto que contém informações da request
     * @param votes   Quantidade de votos disponíveis
     */
    public synchronized void updateVotes(HttpServletRequest request, Long votes) {
        getUserLogged(request).setVotosDisponiveis(votes);
        log.info("Votos disponíveis pelo usuário logado foram atualizados na sessão");
    }

    /**
     * Método que finaliza a sessão do usuário
     *
     * @param request Objeto que contém informações da request
     */
    public synchronized void logout(HttpServletRequest request) {
        try {
            request.getSession().invalidate();
        } catch (Exception ex) {
            log.error("Falha ao finalizar a sessão do usuário");
            log.error(handlerException.buildMessage(ex));
        }
    }

    /**
     * Recupera o usuário logado na sessão
     *
     * @param request Objeto que contém informações da requisição
     * @return Retorna o usuário recuperado na sessão
     */
    public synchronized Usuario getUserLogged(HttpServletRequest request) {
        Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuario");
        log.info("Recuperando sessão do usuário {}", usuarioLogado.getEmail());
        return usuarioLogado;
    }
}
