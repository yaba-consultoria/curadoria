package br.com.yabaconsultoria.curadoria.model;

import br.com.yabaconsultoria.curadoria.enumerated.LevelEstrela;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

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
@Table(name = "analise_projeto_table")
public class AnaliseProjeto extends EntidadeBase{

    @Enumerated(EnumType.STRING)
    private LevelEstrela engajamentoStakeHolders;

    @Enumerated(EnumType.STRING)
    private LevelEstrela alinhamentoNegocios;

    @Enumerated(EnumType.STRING)
    private LevelEstrela visibilidade;

}
