package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Service
public class UsuarioService {

    private UsuarioRepository usuarioRepository;

    @Autowired
    public UsuarioService(UsuarioRepository usuarioRepository){
        this.usuarioRepository = usuarioRepository;
    }

    public Boolean login(String email, String senha){
        Optional<Usuario> usuario = findByEmailAndSenha(email, senha);
        if (usuario.isEmpty()){
            return false;
        }
        return true;
    }

    private Optional<Usuario> findByEmailAndSenha(String email, String senha){
        return this.usuarioRepository.findByEmailAndSenha(email, senha);
    }
}
