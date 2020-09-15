package br.com.yabaconsultoria.curadoria.enumerated;

import lombok.Getter;
import lombok.ToString;

/**
 * Classe que categoriza os tipos de categorias
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 08/09/2020
 */
@Getter
@ToString
public enum TipoCategoria {
    CULTURA("Cultura"),
    CRIANCA_ADOLESCENTE("Criança e Adolescente"),
    IDOSO("Idoso"),
    ESPORTE("Esporte");

    private String descricao;

    TipoCategoria(String descricao) {
        this.descricao = descricao;
    }
}
