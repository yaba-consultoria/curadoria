package br.com.yabaconsultoria.curadoria.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.util.Objects;

/**
 * Classe modelo que contém a base de uma entidade para ser persistida na base de dados
 * ID Incremental base
 * Hash e Equals base
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@MappedSuperclass
@Getter
@Setter
@ToString
public class EntidadeBase implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    public EntidadeBase() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EntidadeBase that = (EntidadeBase) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
