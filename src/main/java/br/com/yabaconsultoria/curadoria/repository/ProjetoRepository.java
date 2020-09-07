package br.com.yabaconsultoria.curadoria.repository;

import br.com.yabaconsultoria.curadoria.model.Projeto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Repository
public interface ProjetoRepository extends JpaRepository<Projeto, Long> {

    Page<Projeto> findAllByTituloContaining(Pageable pageable, String titulo);
}
