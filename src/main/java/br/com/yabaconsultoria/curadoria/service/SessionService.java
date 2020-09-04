package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Usuario;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 04/09/2020
 */
@Service
public class SessionService {

    private Map<String,Usuario> usersSession = new HashMap<>();

    public synchronized void register(HttpSession session, Usuario usuario) {
        usersSession.put(session.getId(), usuario);
        session.setAttribute("usuario", usuario);
    }

    public synchronized void logout(HttpSession session) {
        usersSession.remove(session.getId());
        session.invalidate();
    }

    public synchronized Usuario getUserLogged(HttpServletRequest request){
        return (Usuario) request.getSession().getAttribute("usuario");
    }

    public synchronized Integer getNumbersSessions(){
        return usersSession.size();
    }
}
