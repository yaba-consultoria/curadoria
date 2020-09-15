package br.com.yabaconsultoria.curadoria.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Classe modelo que contém atributos da localidade do projeto
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
@Table(name = "localidade_table")
public class Localidade extends EntidadeBase {

    private String cidade;

    private String estado;
}
