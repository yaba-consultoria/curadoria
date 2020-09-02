package br.com.yabaconsultoria.curadoria.model;

import br.com.yabaconsultoria.curadoria.enumerated.TipoArquivo;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Transient;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
public class Arquivo extends EntidadeBase{

    private String nome;

    private String url;

    @Enumerated(EnumType.STRING)
    private TipoArquivo tipo;

    private String extensao;

    @Transient
    private MultipartFile anexo;
}
