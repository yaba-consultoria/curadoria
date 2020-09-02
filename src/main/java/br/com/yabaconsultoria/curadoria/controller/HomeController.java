package br.com.yabaconsultoria.curadoria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class HomeController {

    @GetMapping("/hello")
    public String helloWorld(){
        return "index";
    }
}
