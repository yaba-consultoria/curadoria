package br.com.yabaconsultoria.curadoria.model;

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
@Table(name = "usuarios_table",
        uniqueConstraints = @UniqueConstraint(columnNames = "email", name = "user_has_unique_email"))
public class Usuario extends EntidadeBase{

    private String nome;

    private String email;

    private String senha;

    private Boolean admin;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_id")
    private Empresa empresa;

    public Usuario(){
        admin = false;
    }
}
