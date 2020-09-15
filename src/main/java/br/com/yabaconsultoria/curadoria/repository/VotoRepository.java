package br.com.yabaconsultoria.curadoria.repository;

import br.com.yabaconsultoria.curadoria.model.Categoria;
import br.com.yabaconsultoria.curadoria.model.Projeto;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.model.Voto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 09/09/2020
 */
@Repository
public interface VotoRepository extends JpaRepository<Voto, Long> {
    Long countByCategoria(Categoria categoria);
    Long countByUsuarioAndCategoria(Usuario usuario, Categoria categoria);
    Long countByCategoriaAndProjeto(Categoria categoria, Projeto projeto);

    Boolean existsByUsuarioAndCategoriaAndProjeto(Usuario usuario, Categoria categoria, Projeto projeto);

    void deleteByCategoriaAndProjeto(Categoria categoria, Projeto projeto);

    void deleteAllByCategoria(Categoria categoria);
    void deleteAllByUsuarioAndCategoria(Usuario usuario, Categoria categoria);

    // Queries personalizadas
    
    @Query("SELECT voto.projeto FROM Voto voto WHERE voto.categoria = :categoria GROUP BY voto.projeto")
    List<Projeto> findAllProjectByCategoria(@Param("categoria") Categoria categoria);

    @Query("SELECT voto.usuario FROM Voto voto WHERE voto.categoria = :categoria GROUP BY voto.usuario.id HAVING COUNT(voto.id) = :votos")
    List<Usuario> findUserWithParamVotosByCategoria(@Param("categoria") Categoria categoria, @Param("votos") Long votos);

    @Query("SELECT COUNT(DISTINCT voto.usuario.id) FROM Voto voto WHERE voto.categoria = :categoria")
    Long countUsuariosWithVoto(@Param("categoria") Categoria categoria);
}
