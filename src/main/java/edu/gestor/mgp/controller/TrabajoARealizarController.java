package edu.gestor.mgp.controller;

import edu.gestor.mgp.model.TrabajoARealizar;
import edu.gestor.mgp.repository.TrabajoARealizarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/trabajos")
public class TrabajoARealizarController {

    @Autowired
    private TrabajoARealizarRepository trabajoRepository;

    @GetMapping("/listar")
    public String listarTrabajos(Model model) {
        List<TrabajoARealizar> trabajos = trabajoRepository.findAll();
        model.addAttribute("trabajos", trabajos);
        return "trabajos";
    }

}
