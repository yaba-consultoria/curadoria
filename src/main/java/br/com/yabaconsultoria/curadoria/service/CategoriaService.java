package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.enumerated.StatusCategoria;
import br.com.yabaconsultoria.curadoria.model.Categoria;
import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.model.Projeto;
import br.com.yabaconsultoria.curadoria.repository.CategoriaRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Classe de serviços da Categoria
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Service
@Slf4j
public class CategoriaService {

    private CategoriaRepository categoriaRepository;

    @Autowired
    public CategoriaService(CategoriaRepository categoriaRepository) {
        this.categoriaRepository = categoriaRepository;
    }

    /**
     * Método que persiste a categoria na base de dados
     *
     * @param categoria Categoria persistida
     * @return Retorna a categoria persistida
     */
    public Categoria save(Categoria categoria) {
        this.categoriaRepository.save(categoria);
        log.info("Categoria persistida com sucesso");
        return categoria;
    }

    /**
     * Método que localizada uma categoria por código identificador
     *
     * @param id Código identificador da categoria
     * @return Retorna a categoria localizada ou lança uma exception caso não localizado
     */
    public Categoria findById(Long id) {
        return this.categoriaRepository.findById(id).orElseThrow(() -> new RuntimeException("Categoria não localizada."));
    }

    /**
     * Método que atualia a categoria na base de dados
     *
     * @param categoria Categoria que será atualizada
     */
    public void update(Categoria categoria) {
        this.categoriaRepository.save(categoria);
    }

    /**
     * Método que atualiza o status da categoria
     *
     * @param categoria       Categoria que será atualizada
     * @param statusCategoria Novo status da categoria
     */
    public void updateStatus(Categoria categoria, StatusCategoria statusCategoria) {
        categoria.setStatus(statusCategoria);
        this.update(categoria);
        log.info("Status da categoria #{} atualizado com sucesso", categoria.getId());
    }

    /**
     * Adiciona projetos na categoria
     *
     * @param categoria Categoria que irá receber os projetos
     * @param projetos  Lista de projetos que será relacionada na categoria
     */
    public void addProjetos(Categoria categoria, List<Projeto> projetos) {
        categoria.getProjetos().addAll(projetos);
        this.update(categoria);
        log.info("Projetos adicionados com sucesso na categoria #{}", categoria.getId());
    }

    /**
     * Remove projeto da categoria
     *
     * @param categoria Categoria que terá o projeto removido
     * @param projeto   Projeto que será removido do relacionamento
     */
    public void removeProjeto(Categoria categoria, Projeto projeto) {
        categoria.getProjetos().remove(projeto);
        this.update(categoria);
        log.info("Projeto {} removido com sucesso da categoria #{}", projeto.getTitulo(), categoria.getId());
    }

    /**
     * Limpa a lista de projetos da categoria
     *
     * @param categoria Categoria que terá a lista de projetos removidos
     */
    public void clearProjetos(Categoria categoria) {
        categoria.getProjetos().clear();
        this.update(categoria);
        log.info("Lista de projetos da categoria #{} removida", categoria.getId());
    }

    /**
     * Deleta uma categoria
     *
     * @param categoria Categoria que será deletada
     */
    public void delete(Categoria categoria) {
        this.clearProjetos(categoria);
        this.categoriaRepository.deleteById(categoria.getId());
        log.info("Categoria #{} deletada com sucesso", categoria.getId());
    }

    /**
     * Lista as categorias de uma campanha realizada por uma empresa com atributos de paginação
     *
     * @param empresa  Empresa detendora da campanha
     * @param status   Status da categoria que deseja buscar
     * @param pageable Objeto que contém atributos de paginação
     * @return Retorna uma lista de categorias
     */
    public Page<Categoria> findAllByCampanhaEmpresaAndStatus(Empresa empresa, StatusCategoria status, Pageable pageable) {
        return this.categoriaRepository.findAllByCampanhaEmpresaAndStatus(empresa, status, pageable);
    }

    /**
     * Contabiliza a quantidade de categorias cadastradas
     *
     * @return Retorna o número de categorias cadastradas
     */
    public Long count() {
        return this.categoriaRepository.count();
    }

}
