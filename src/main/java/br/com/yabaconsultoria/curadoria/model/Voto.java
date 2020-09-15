package br.com.yabaconsultoria.curadoria.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

/**
 * Classe modelo que contém atributos do voto que o projeto recebe
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
@Table(name = "voto_table", uniqueConstraints = {
        @UniqueConstraint(name = "categoria_has_unique_voto_user", columnNames = {"usuario_id", "projeto_id", "categoria_id"})
})
public class Voto extends EntidadeBase {

    private Date dataRegistro;

    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario usuario;

    @ManyToOne(fetch = FetchType.EAGER)
    private Projeto projeto;

    @ManyToOne(fetch = FetchType.LAZY)
    private Categoria categoria;

    public Voto() {
        this.dataRegistro = new Date();
    }
}
