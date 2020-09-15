package br.com.yabaconsultoria.curadoria.handler;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.*;

/**
 * Classe responsável por personalizar e buildar as mensagem das Exceptions
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 03/09/2020
 */
@ControllerAdvice
public class HandlerException {

    private String message;

    public HandlerException() {
        this.message = new String();
    }

    /**
     * Método que builda a mensagem de acorda com a Exception lançada
     *
     * @param ex
     * @return
     */
    public String buildMessage(Exception ex) {
        if (ex instanceof ConstraintViolationException) {
            buildMessageConstraintViolationException((ConstraintViolationException) ex);
        } else if (ex instanceof DataIntegrityViolationException) {
            buildMessageDataIntegrityViolationException((DataIntegrityViolationException) ex);
        } else if (ex instanceof SQLIntegrityConstraintViolationException) {
            buildMessageSQLIntegrityConstraintViolationException((SQLIntegrityConstraintViolationException) ex);
        } else {
            this.message = ex.getLocalizedMessage();
        }
        return this.message;
    }

    /**
     * Builda a mensagem de erro relacionadas a ConstraintViolationException
     *
     * @param ex Exception lançada
     */
    @ExceptionHandler(ConstraintViolationException.class)
    public void buildMessageConstraintViolationException(ConstraintViolationException ex) {
        Set<ConstraintViolation<?>> violations = ex.getConstraintViolations();
        for (ConstraintViolation<?> violation : violations) {
            this.message = violation.getMessage().concat(";");
        }
    }

    /**
     * Builda a mensagem de erro relacionadas a DataIntegrityViolationException
     *
     * @param ex Exception lançada
     */
    @ExceptionHandler(DataIntegrityViolationException.class)
    public void buildMessageDataIntegrityViolationException(DataIntegrityViolationException ex) {

        Map<String, String> constraintCodeMap = new HashMap<>() {
            {
                put("categorias_has_unique_projeto", "Projeto já cadastrado nesta categoria.</br>");
                put("campanha_has_unique_categoria_tipo", "Categoria já cadastrada para esta campanha.</br>");
                put("campanhas_has_unique_categoria_voto_user", "Este projeto ja foi votado nesta categoria.</br>");
                put("user_has_unique_email", "Usuário já cadastrado com este e-mail.</br>");
                put("FKln94qs0lnp25pah80yrk7ijdo", "Projeto está participando de uma votação.</br>");
            }
        };

        Optional<Map.Entry<String, String>> entry = constraintCodeMap.entrySet().stream()
                .filter((it) -> Objects.requireNonNull(ex.getRootCause()).getMessage().contains(it.getKey()))
                .findAny();
        this.message = entry.map(Map.Entry::getValue).orElse(null);
    }

    /**
     * Builda a mensagem de erro relacionadas a SQLIntegrityConstraintViolationException
     *
     * @param ex Exception lançada
     */
    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    public void buildMessageSQLIntegrityConstraintViolationException(SQLIntegrityConstraintViolationException ex) {
        this.message = ex.getLocalizedMessage();
    }
}
