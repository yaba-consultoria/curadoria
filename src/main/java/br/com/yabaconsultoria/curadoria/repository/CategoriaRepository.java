package br.com.yabaconsultoria.curadoria.repository;

import br.com.yabaconsultoria.curadoria.enumerated.StatusCategoria;
import br.com.yabaconsultoria.curadoria.model.Categoria;
import br.com.yabaconsultoria.curadoria.model.Empresa;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {
    Page<Categoria> findAllByCampanhaEmpresaAndStatus(Empresa empresa, StatusCategoria status, Pageable pageable);
}
