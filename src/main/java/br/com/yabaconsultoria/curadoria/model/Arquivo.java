package br.com.yabaconsultoria.curadoria.model;

import br.com.yabaconsultoria.curadoria.enumerated.TipoArquivo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Entity
@DynamicUpdate
@Getter
@Setter
@ToString
@Table(name = "arquivo_table")
public class Arquivo extends EntidadeBase{

    private String nome;

    private String caminhoRelativo;

    private String caminhoAbsoluto;

    @Enumerated(EnumType.STRING)
    private TipoArquivo tipo;

    private String extensao;

    @Transient
    private MultipartFile anexo;
}
