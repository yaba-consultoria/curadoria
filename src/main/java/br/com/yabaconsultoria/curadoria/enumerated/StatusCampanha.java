package br.com.yabaconsultoria.curadoria.enumerated;

import lombok.Getter;
import lombok.ToString;

/**
 * Classe que categoriza os status da Campanha
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Getter
@ToString
public enum StatusCampanha {
    CRIADO("Criado"),
    ABERTO("Aberto"),
    FECHADO("Fechado");

    private String descricao;

    StatusCampanha(String descricao) {
        this.descricao = descricao;
    }
}
