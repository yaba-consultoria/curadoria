package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Projeto;
import br.com.yabaconsultoria.curadoria.repository.ProjetoRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
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

    public Projeto save(Projeto projeto){
        this.projetoRepository.save(projeto);
        log.info("Projeto {} persistido com sucesso.", projeto.getTitulo());
        return projeto;
    }

    public Projeto findById(Long projetoId){
        return this.projetoRepository.findById(projetoId).orElseThrow(() -> new RuntimeException("Projeto não localizado"));
    }

    public void upload(HttpServletRequest request, Projeto projeto){
        arquivoService.upload(request, projeto.getLogo());
        log.info("Upload finalizado com sucesso.");
        update(projeto);
    }

    public Page<Projeto> findAll(Pageable pageable){
        return this.projetoRepository.findAll(pageable);
    }

    public Page<Projeto> findAllByTituloContaining(Pageable pageable, String titulo){
        return this.projetoRepository.findAllByTituloContaining(pageable, titulo);
    }

    public void deleteById(Projeto projeto){
        this.projetoRepository.deleteById(projeto.getId());
    }

    private void update(Projeto projeto){
        this.projetoRepository.save(projeto);
        log.info("Projeto {} atualizado.", projeto.getTitulo());
    }
}
