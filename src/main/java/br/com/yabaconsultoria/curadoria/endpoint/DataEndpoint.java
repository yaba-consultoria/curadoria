package br.com.yabaconsultoria.curadoria.endpoint;

import br.com.yabaconsultoria.curadoria.service.EmpresaService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@RestController
public class DataEndpoint {

    private EmpresaService empresaService;

    public DataEndpoint(EmpresaService empresaService) {
        this.empresaService = empresaService;
    }

    @GetMapping("/endpoint/empresas/count")
    public ResponseEntity<?> countEmpresas(){
        return new ResponseEntity<>(empresaService.count(), HttpStatus.OK);
    }
}
