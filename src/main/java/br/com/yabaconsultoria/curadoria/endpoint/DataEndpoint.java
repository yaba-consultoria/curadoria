package br.com.yabaconsultoria.curadoria.endpoint;

import br.com.yabaconsultoria.curadoria.model.Categoria;
import br.com.yabaconsultoria.curadoria.service.CategoriaService;
import br.com.yabaconsultoria.curadoria.service.EmpresaService;
import br.com.yabaconsultoria.curadoria.service.VotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * Classe que expoe endpoints para consumir os dados da base de dados
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@RestController
@CrossOrigin
public class DataEndpoint {

    private EmpresaService empresaService;
    private CategoriaService categoriaService;
    private VotoService votoService;

    @Autowired
    public DataEndpoint(EmpresaService empresaService, CategoriaService categoriaService, VotoService votoService) {
        this.empresaService = empresaService;
        this.categoriaService = categoriaService;
        this.votoService = votoService;
    }

    /**
     * Expoe os dados para construção do gráfico de resultados dos votos
     *
     * @param campanhaId  Código identificador da campanha
     * @param categoriaId Código identificador da categoria
     * @return Retorna um vetor que contém a quantidade de usuário com determinada quantidade de votos em cada index
     */
    @GetMapping("/endpoint/campanhas/{campanhaId}/categorias/{categoriaId}/resultado/votos")
    public ResponseEntity<?> getResultsVotosBarChart(@PathVariable Long campanhaId, @PathVariable Long categoriaId) {
        Categoria categoria = categoriaService.findById(categoriaId);
        List<Integer> result = new ArrayList<>();
        result.add(votoService.findUserWithParamVotosByCategoria(categoria, 1L).size());
        result.add(votoService.findUserWithParamVotosByCategoria(categoria, 2L).size());
        result.add(votoService.findUserWithParamVotosByCategoria(categoria, 3L).size());
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
