package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Arquivo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Objects;
import java.util.UUID;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 03/09/2020
 */
@Service
@Slf4j
public class ArquivoService {

    private LocalStorageService localStorageService;

    @Autowired
    public ArquivoService(LocalStorageService localStorageService) {
        this.localStorageService = localStorageService;
    }

    public void upload(HttpServletRequest request, Arquivo arquivo){
        prepare(arquivo);
        this.localStorageService.upload(request, arquivo);
    }


    private void prepare(Arquivo arquivo){
        arquivo.setNome(generateFileName(arquivo.getAnexo()));
        arquivo.setExtensao(getExtension(arquivo.getNome()));
        arquivo.setCaminhoRelativo("documentos/projetos/" + UUID.randomUUID());
        log.info("Preparando arquivo para upload ...");
    }

    private String generateFileName(MultipartFile multiPart) {
        return new Date().getTime() + "-" + Objects.requireNonNull(multiPart.getOriginalFilename()).replace(" ", "_")
                .toLowerCase();
    }

    private String getExtension(String fileName){
        if(fileName.contains(".")){
            return fileName.substring(fileName.lastIndexOf(".") + 1);
        }
        log.error("Falha ao extrair extensão do arquivo.");
        throw new RuntimeException("Extensão não encontrada.");
    }
}
