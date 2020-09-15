package br.com.yabaconsultoria.curadoria.enumerated;

import lombok.Getter;
import lombok.ToString;

/**
 * Classe que categoriza os status da categoria
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Getter
@ToString
public enum StatusCategoria {
    CRIADO("Criado"),
    ABERTO("Aberto"),
    FECHADO("Fechado");

    private String descricao;

    StatusCategoria(String descricao) {
        this.descricao = descricao;
    }
}
