package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.handler.HandlerException;
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
 * Classe de serviço para os métodos de arquivo
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 03/09/2020
 */
@Service
@Slf4j
public class ArquivoService {

    private LocalStorageService localStorageService;
    private HandlerException handlerException;

    @Autowired
    public ArquivoService(LocalStorageService localStorageService, HandlerException handlerException) {
        this.localStorageService = localStorageService;
        this.handlerException = handlerException;
    }

    /**
     * Método que realiza upload do arquivo
     *
     * @param request Objeto que contém informações da requisição
     * @param arquivo Arquivo persistido
     */
    public void upload(HttpServletRequest request, Arquivo arquivo) {
        prepare(arquivo);
        this.localStorageService.upload(request, arquivo);
        log.info("Upload realizado com sucesso {}", arquivo.getCaminhoAbsoluto());
    }

    /**
     * Método que deleta o arquivo
     *
     * @param arquivo Arquivo que deseja deletado
     */
    public void delete(Arquivo arquivo) {
        this.localStorageService.delete(arquivo);
        log.info("Arquivo deletado com sucesso {}", arquivo.getCaminhoAbsoluto());
    }

    /**
     * Método que prepara o arquivo para upload
     *
     * @param arquivo Arquivo que está sendo persistido
     */
    private void prepare(Arquivo arquivo) {
        arquivo.setNome(generateFileName(arquivo.getAnexo()));
        arquivo.setExtensao(getExtension(arquivo.getNome()));
        arquivo.setCaminhoRelativo("documentos/projetos/" + UUID.randomUUID());
        log.info("Preparando arquivo para upload ...");
    }

    /**
     * Método que gera nome único para o arquivo
     *
     * @param multiPart Objeto que contém informações do arquivo
     * @return Retorna o nome gerado do arquivo
     */
    private String generateFileName(MultipartFile multiPart) {
        String arquivoNome = new Date().getTime() + "-" + Objects.requireNonNull(multiPart.getOriginalFilename()).replace(" ", "_")
                .toLowerCase();
        log.info("Gerando nome do arquivo ...");
        return arquivoNome;
    }

    /**
     * Método que captura a extensão do arquivo
     *
     * @param fileName Nome do arquivo
     * @return Retorna a extensão do arquivo capturada
     */
    private String getExtension(String fileName) {
        try {
            if (fileName.contains(".")) return fileName.substring(fileName.lastIndexOf(".") + 1);
            log.error("Falha ao extrair extensão do arquivo.");
        } catch (Exception ex) {
            log.warn("Falha ao capturar a extensão do arquivo {}", handlerException.buildMessage(ex));
        }
        return null;
    }
}
