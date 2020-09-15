package br.com.yabaconsultoria.curadoria.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import javax.validation.constraints.Email;

/**
 * Classe modelo que contém atributos do usuário
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
@Table(name = "usuarios_table",
        uniqueConstraints = @UniqueConstraint(columnNames = "email", name = "user_has_unique_email"))
public class Usuario extends EntidadeBase {

    private String nome;

    @Email
    private String email;

    private Boolean admin;

    @ManyToOne(fetch = FetchType.LAZY)
    private Empresa empresa;

    // Este atributos armazena a quantidade de votos disponíveis para o usuário logado na categoria visualizada
    @Transient
    private Long votosDisponiveis;

    public Usuario() {
        admin = false;
    }
}
