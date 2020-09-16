package br.com.yabaconsultoria.curadoria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Classe controller por fazer a chamada da URI inicial
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class HomeController {

    @GetMapping({"", "/"})
    public String getHome() {
        return "home/index";
    }
}
