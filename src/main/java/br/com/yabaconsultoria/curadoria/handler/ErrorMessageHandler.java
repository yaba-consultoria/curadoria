package br.com.yabaconsultoria.curadoria.handler;

import org.springframework.stereotype.Component;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.Set;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 03/09/2020
 */
@Component
public class ErrorMessageHandler {

    private StringBuilder message;

    public StringBuilder buildConstraintViolationMessage(ConstraintViolationException ex){
        this.message = new StringBuilder();
        Set<ConstraintViolation<?>> violations = ex.getConstraintViolations();
        for (ConstraintViolation<?> violation : violations) {
            message.append(violation.getMessage().concat(";"));
        }
        return this.message;
    }
}
