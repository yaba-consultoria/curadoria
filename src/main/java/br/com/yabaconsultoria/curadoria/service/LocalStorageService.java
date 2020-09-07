package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Arquivo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 04/09/2020
 */
@Slf4j
@Service
public class LocalStorageService implements Serializable {

    private String ABSOLUTE_PATH = null;

    public void upload(HttpServletRequest request, Arquivo arquivo) {

        ABSOLUTE_PATH = request.getServletContext().getRealPath(arquivo.getCaminhoRelativo());

        if (!new File(ABSOLUTE_PATH).exists()) {
            new File(ABSOLUTE_PATH).mkdirs();
            arquivo.setCaminhoAbsoluto(ABSOLUTE_PATH + "/" + arquivo.getNome());
            arquivo.setCaminhoRelativo(arquivo.getCaminhoRelativo() + "/" + arquivo.getNome());
        }

        try {
            arquivo.getAnexo().transferTo(new File(arquivo.getCaminhoAbsoluto()));
            log.info("Arquivo salvo: " + arquivo.getCaminhoAbsoluto());
        } catch (IOException e) {
            log.error("Falha ao fazer upload do arquivo: " + arquivo.getCaminhoAbsoluto());
        }
    }

    public void deletar(HttpServletRequest request, Arquivo arquivo) {
        ABSOLUTE_PATH = arquivo.getCaminhoAbsoluto();
        File file = new File(ABSOLUTE_PATH);
        if (file.exists()) {
            file.delete();
            log.info("Arquivo excluído com sucesso: " + ABSOLUTE_PATH);
        } else {
            log.error("Falha ao tentar excluir o arquivo: " + ABSOLUTE_PATH);
        }
    }
}
