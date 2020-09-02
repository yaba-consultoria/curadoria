package br.com.yabaconsultoria.curadoria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 02/09/2020
 */
@Controller
public class DashboardController {

    @GetMapping("/dashboard")
    public String getDashboard(){
        return "dashboard/index";
    }
}
