package br.com.yabaconsultoria.curadoria.enumerated;

import lombok.Getter;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Getter
public enum LevelEstrela {

    RUIM(1),
    MEDIO(2),
    BOM(3);

    private Integer level;

    LevelEstrela(Integer level) {
        this.level = level;
    }
}
