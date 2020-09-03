package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Empresa;
import br.com.yabaconsultoria.curadoria.repository.EmpresaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Service
public class EmpresaService {

    private EmpresaRepository empresaRepository;

    @Autowired
    public EmpresaService(EmpresaRepository empresaRepository){
        this.empresaRepository = empresaRepository;
    }

    public Empresa save(Empresa empresa){
        return this.empresaRepository.save(empresa);
    }

    public List<Empresa> findAll(){
        return this.empresaRepository.findAll();
    }

    public Long count(){
        return this.empresaRepository.count();
    }
}
