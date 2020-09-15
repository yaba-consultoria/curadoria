package br.com.yabaconsultoria.curadoria.repository;

import br.com.yabaconsultoria.curadoria.model.Empresa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Repository
public interface EmpresaRepository extends JpaRepository<Empresa, Long> {
    Optional<Empresa> findByCnpj(String cnpj);
}
