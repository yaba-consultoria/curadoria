package br.com.yabaconsultoria.curadoria.model;

import br.com.yabaconsultoria.curadoria.enumerated.StatusCategoria;
import br.com.yabaconsultoria.curadoria.enumerated.TipoCategoria;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.List;

/**
 * Classe modelo que contém atributos da categoria de uma campanha
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Entity
@DynamicUpdate
@Getter
@Setter
@ToString(exclude = {"campanha"})
@Table(name = "categoria_table",
        uniqueConstraints = @UniqueConstraint(
                name = "campanha_has_unique_categoria_tipo", columnNames = {"tipo", "campanha_id"}
        )
)
public class Categoria extends EntidadeBase {

    @Enumerated(EnumType.STRING)
    private TipoCategoria tipo;

    @Enumerated(EnumType.STRING)
    private StatusCategoria status;

    @ManyToOne(fetch = FetchType.EAGER)
    private Campanha campanha;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
    @JoinTable(name = "categoria_has_projetos_table",
            joinColumns = @JoinColumn(name = "categoria_id"),
            inverseJoinColumns = @JoinColumn(name = "projeto_id"),
            uniqueConstraints = @UniqueConstraint(
                    name = "categorias_has_unique_projeto", columnNames = {"projeto_id", "categoria_id"}
            )
    )
    private List<Projeto> projetos;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "categoria")
    private List<Voto> votos;

    public Categoria() {
        this.status = StatusCategoria.CRIADO;
    }
}
