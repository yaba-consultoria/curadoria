package br.com.yabaconsultoria.curadoria.model;

import br.com.yabaconsultoria.curadoria.enumerated.LevelEstrela;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

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
@Table(name = "projeto_table")
public class Projeto extends EntidadeBase{

    private String titulo;

    private String proponente;

    @Column(columnDefinition = "TEXT")
    private String resumo;

    @Column(columnDefinition = "TEXT")
    private String parceiros;

    private Integer beneficiariosDireto;

    private Integer beneficiariosIndireto;

    private String orcamento;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "analise_projeto_id")
    private AnaliseProjeto analise;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "localidade_id")
    private Localidade localidade;
}
