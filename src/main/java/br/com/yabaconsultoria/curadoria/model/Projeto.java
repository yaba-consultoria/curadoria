package br.com.yabaconsultoria.curadoria.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * Classe modelo que contém atributos do projeto
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */

@Entity
@DynamicUpdate
@Getter
@Setter
@ToString
@Table(name = "projeto_table")
public class Projeto extends EntidadeBase {

    private String titulo;

    private String proponente;

    @Column(columnDefinition = "TEXT")
    private String resumo;

    @Column(columnDefinition = "TEXT")
    private String parceiros;

    private Integer beneficiariosDireto;

    private Integer beneficiariosIndireto;

    private String valorSolicitado;

    private String valorTotal;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Arquivo logo;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private AnaliseProjeto analise;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Localidade localidade;

    // Esta variável verifica se o projeto pode ser votado ou não na categoria
    @Transient
    private Boolean canVote;

    // esta variável armazena a quantidade de votos que aquele projeto recebeu em uma categoria
    @Transient
    private Long totalVotos;

}
