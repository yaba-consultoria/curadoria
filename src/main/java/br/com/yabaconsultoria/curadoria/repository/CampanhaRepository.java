package br.com.yabaconsultoria.curadoria.repository;

import br.com.yabaconsultoria.curadoria.model.Campanha;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Service
public interface CampanhaRepository extends JpaRepository<Campanha, Long> {
}
