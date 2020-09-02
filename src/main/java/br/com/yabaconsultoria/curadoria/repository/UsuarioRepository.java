package br.com.yabaconsultoria.curadoria.repository;

import br.com.yabaconsultoria.curadoria.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}
