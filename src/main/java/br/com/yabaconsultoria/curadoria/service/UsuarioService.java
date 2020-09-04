package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public Usuario save(Usuario usuario, Empresa empresa){
        usuario.setEmpresa(empresa);
        return this.usuarioRepository.save(usuario);
    }

    public Boolean existsByEmail(String email){
        return this.usuarioRepository.existsByEmail(email);
    }

    public Boolean login(String email, String senha){
        return this.usuarioRepository.existsByEmailAndSenha(email, senha);
    }

    public Usuario findByEmail(String email){
        return this.usuarioRepository.findByEmail(email).orElseThrow(() -> new RuntimeException("Usuário não localizado."));
    }
}
