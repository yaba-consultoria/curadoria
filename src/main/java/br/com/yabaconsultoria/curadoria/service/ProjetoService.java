package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Projeto;
import br.com.yabaconsultoria.curadoria.repository.ProjetoRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Classe de serviço de projetos
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 03/09/2020
 */
@Service
@Slf4j
public class ProjetoService {

    private ProjetoRepository projetoRepository;
    private ArquivoService arquivoService;

    @Autowired
    public ProjetoService(ProjetoRepository projetoRepository, ArquivoService arquivoService) {
        this.projetoRepository = projetoRepository;
        this.arquivoService = arquivoService;
    }

    /**
     * Persiste um projeto na base de dados
     *
     * @param projeto Projeto persistido
     * @return Retorna o projeto persistido
     */
    public Projeto save(Projeto projeto) {
        this.projetoRepository.save(projeto);
        log.info("Projeto {} persistido com sucesso.", projeto.getTitulo());
        return projeto;
    }

    /**
     * Localiza um projeto na base de dados por código identificador
     *
     * @param projetoId Código identificador do projeto
     * @return Retorna o projeto localizado ou lança uma exceção caso não localizado
     */
    public Projeto findById(Long projetoId) {
        return this.projetoRepository.findById(projetoId).orElseThrow(() -> new RuntimeException("Projeto não localizado"));
    }

    /**
     * Atualiza um projeto na base de dados
     *
     * @param projeto Projeto que será atualizado
     */
    private void update(Projeto projeto) {
        this.projetoRepository.save(projeto);
        log.info("Projeto {} atualizado.", projeto.getTitulo());
    }

    /**
     * Realiza upload do logo do projeto
     *
     * @param request Objeto que contém informações da requisição
     * @param projeto Projeto que contém o arquivo para upload
     */
    public void uploadFile(HttpServletRequest request, Projeto projeto) {
        arquivoService.upload(request, projeto.getLogo());
        update(projeto);
    }

    /**
     * Deleta o logo do projeto
     *
     * @param projeto Projeto que possui o logo que será deletado
     */
    public void deleteFile(Projeto projeto) {
        arquivoService.delete(projeto.getLogo());
        log.info("Arquivo deletado com sucesso.");
    }

    /**
     * Lista todos os projeto cadastrados
     *
     * @return Retorna uma lista de projetos localizados
     */
    public List<Projeto> findAll() {
        return this.projetoRepository.findAll();
    }

    /**
     * Lista todos os projetos da base de dados com atributos de paginação
     *
     * @param pageable Objeto que contém atributos de paginação
     * @return Retorna uma lista de projetos localizados
     */
    public Page<Projeto> findAll(Pageable pageable) {
        return this.projetoRepository.findAll(pageable);
    }

    /**
     * Lista todos os projetos localizados de acordo com %título% passado como parâmetro com paginação
     *
     * @param pageable Objeto que contém atributos de paginação
     * @param titulo   Título do projeto pesquisado
     * @return Retorna uma lista de projetos localizados
     */
    public Page<Projeto> findAllByTituloContaining(Pageable pageable, String titulo) {
        return this.projetoRepository.findAllByTituloContaining(pageable, titulo);
    }

    /**
     * Deleta um projeto e exclui seus arquivos
     *
     * @param projeto projeto que será deletado
     */
    public void deleteById(Projeto projeto) {
        this.projetoRepository.delete(projeto);
        this.deleteFile(projeto);
        log.info("Projeto {} deletado com sucesso", projeto.getTitulo());
    }

    /**
     * Contabiliza a quantidade de projetos cadastrados na base de dados
     *
     * @return Retorna a quantidade de projetos localizados
     */
    public Long count() {
        return this.projetoRepository.count();
    }
}
