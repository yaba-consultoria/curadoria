package br.com.yabaconsultoria.curadoria.model;

import br.com.yabaconsultoria.curadoria.enumerated.StatusCampanha;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Classe modelo que contém atributos da campanha de uma empresa
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Entity
@DynamicUpdate
@Getter
@Setter
@ToString
@Table(name = "campanha_table")
public class Campanha extends EntidadeBase {

    private Date dataRegistro;

    private String nome;

    @Enumerated(EnumType.STRING)
    private StatusCampanha status;

    @ManyToOne(fetch = FetchType.EAGER)
    private Empresa empresa;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "campanha_has_categorias_table")
    private List<Categoria> categorias;

    public Campanha() {
        this.dataRegistro = new Date();
        this.status = StatusCampanha.CRIADO;
    }

}
