package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.repository.EmpresaRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Classe de serviço para métodos da empresa
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Service
@Slf4j
public class EmpresaService {

    private EmpresaRepository empresaRepository;

    @Autowired
    public EmpresaService(EmpresaRepository empresaRepository) {
        this.empresaRepository = empresaRepository;
    }

    /**
     * Método que persiste a empresa
     *
     * @param empresa Empresa persistida
     * @return Retorna a empresa persitida
     */
    public Empresa save(Empresa empresa) {
        this.empresaRepository.save(empresa);
        log.info("Empresa persitida com sucesso {}", empresa.getNome());
        return empresa;
    }

    /**
     * Método que busca empresa por código identificado
     *
     * @param id Código identificador da empresa
     * @return Retorna a empresa localizada ou lança uma exceção caso não localizada
     */
    public Empresa findById(Long id) {
        return this.empresaRepository.findById(id).orElseThrow(() -> new RuntimeException("Empresa não localizada"));
    }

    /**
     * Método que busca empresa por código cnpj
     *
     * @param cnpj Cnpj da empresa
     * @return Retorna a empresa localizada ou lança uma exceção caso não localizada
     */
    public Empresa findByCnpj(String cnpj) {
        return this.empresaRepository.findByCnpj(cnpj).orElseThrow(() -> new RuntimeException("Empresa não localizada"));
    }

    /**
     * Lista todas as empresas cadastradas
     *
     * @return Retorna uma lista de empresas localizadas
     */
    public List<Empresa> findAll() {
        return this.empresaRepository.findAll();
    }

    /**
     * Contabiliza a quantidade de empresas cadastradas
     *
     * @return Retorna o número de empresas cadastradas
     */
    public Long count() {
        return this.empresaRepository.count();
    }
}
