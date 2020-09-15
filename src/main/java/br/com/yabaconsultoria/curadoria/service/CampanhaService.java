package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.enumerated.StatusCampanha;
import br.com.yabaconsultoria.curadoria.model.Campanha;
import br.com.yabaconsultoria.curadoria.model.Categoria;
import br.com.yabaconsultoria.curadoria.repository.CampanhaRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Classe de serviços para campanha
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Service
@Slf4j
public class CampanhaService {

    private CampanhaRepository campanhaRepository;

    @Autowired
    public CampanhaService(CampanhaRepository campanhaRepository) {
        this.campanhaRepository = campanhaRepository;
    }

    /**
     * Persiste uma campanha
     *
     * @param campanha Campanha que será persistida
     * @return Retorna a campanha persitida
     */
    public Campanha save(Campanha campanha) {
        this.campanhaRepository.save(campanha);
        log.info("Campanha {} cadastrada com sucesso", campanha.getNome());
        return campanha;
    }

    /**
     * Localiza uma campanha na base de dados
     *
     * @param id Código identificador da campanha
     * @return Retorna a campanha localizada ou lança uma exceção caso não localizada
     */
    public Campanha findById(Long id) {
        return this.campanhaRepository.findById(id).orElseThrow(() -> new RuntimeException("Campanha não localizada"));
    }

    /**
     * Atualia a campanha na base de dados
     *
     * @param campanha Campanha que será atualiza
     */
    public void update(Campanha campanha) {
        this.campanhaRepository.save(campanha);
        log.info("Campanha {} atualizada com sucesso", campanha.getNome());
    }

    /**
     * Atualiza o status da campanha
     *
     * @param campanha Campanha que terá o status atualizo
     * @param status   Novo status da campanha
     */
    public void updateStatus(Campanha campanha, StatusCampanha status) {
        campanha.setStatus(status);
        this.update(campanha);
        log.info("Status da campanha {} atualizado", campanha.getNome());
    }

    /**
     * Adiciona categoria na campanha
     *
     * @param campanha  Campanha que irá receber a categoria
     * @param categoria Categoria que será adicionada
     */
    public void addCategoria(Campanha campanha, Categoria categoria) {
        campanha.getCategorias().add(categoria);
        this.update(campanha);
        log.info("Categoria {} adiciona na campanha {} com sucesso", categoria.getTipo().getDescricao(), campanha.getNome());
    }

    /**
     * Remove categoria da campanha
     *
     * @param campanha  Campanha que irá remover a categoria
     * @param categoria Categoria que será removida
     */
    public void removeCategoria(Campanha campanha, Categoria categoria) {
        campanha.getCategorias().remove(categoria);
        this.update(campanha);
        log.info("Categoria {} removida da campanha {} com sucesso", categoria.getTipo().getDescricao(), campanha.getNome());
    }

    /**
     * Limpa a lista de categorias da campanha
     *
     * @param campanha Campanha que terá a lista de campanhas removida
     */
    public void clearCategorias(Campanha campanha) {
        campanha.getCategorias().clear();
        log.info("Categorias removidas da campanha {} com sucesso", campanha.getNome());
    }

    /**
     * Deleta uma campanha
     *
     * @param campanha Campanha que será deletada
     */
    public void delete(Campanha campanha) {
        this.clearCategorias(campanha);
        this.campanhaRepository.delete(campanha);
        log.info("Campanha {} removida com sucesso", campanha.getNome());
    }

    /**
     * Lista as campanhas cadastradas
     *
     * @return Retorna a lista de campanhas localizadas
     */
    public List<Campanha> findAll() {
        return this.campanhaRepository.findAll();
    }

    /**
     * Contabiliza as campanhas cadastradas
     *
     * @return Retorna o número de campanhas localizadas
     */
    public Long count() {
        return this.campanhaRepository.count();
    }
}
