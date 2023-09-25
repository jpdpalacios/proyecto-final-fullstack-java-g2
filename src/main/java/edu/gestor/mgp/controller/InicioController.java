package edu.gestor.mgp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InicioController {

    @GetMapping("/inicio")
    public String mostrarInicio() {
        return "inicio"; // Esto devuelve el nombre de la página HTML sin la extensión (.html)
    }
}
