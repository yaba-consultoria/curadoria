package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.repository.UsuarioRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Classe de serviço para os métodos do usuário
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Service
@Slf4j
public class UsuarioService {

    private UsuarioRepository usuarioRepository;

    @Autowired
    public UsuarioService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    /**
     * Persiste um usuário
     *
     * @param usuario Usuário persistido
     * @param empresa Empresa que o usuário participa
     * @return Retorna o usuário persistido
     */
    public Usuario save(Usuario usuario, Empresa empresa) {
        usuario.setEmpresa(empresa);
        this.usuarioRepository.save(usuario);
        log.info("Usuário cadastrado com sucesso {}", usuario.getEmail());
        return usuario;
    }

    /**
     * Busca um usuário por e-mail
     *
     * @param email E-mail do usuário
     * @return Retorna o usuário localizado ou lança uma exceção caso não localizado
     */
    public Usuario findByEmail(String email) {
        return this.usuarioRepository.findByEmail(email).orElseThrow(() -> new RuntimeException("Usuário não localizado."));
    }

    /**
     * Verifica se o usuário existe por e-mail
     *
     * @param email E-mail do usuário
     * @return Retorna verdadeiro para caso o usuário exista ou falso caso não exista
     */
    public Boolean existsByEmail(String email) {
        return this.usuarioRepository.existsByEmail(email);
    }

    /**
     * Contabiliza usuários cadastrados por empresa
     *
     * @param empresa Empresa que deseja contabilizar
     * @return Retorna o número de usuários cadastrados na empresa
     */
    public Long count(Empresa empresa) {
        return this.usuarioRepository.countByEmpresa(empresa);
    }
}
