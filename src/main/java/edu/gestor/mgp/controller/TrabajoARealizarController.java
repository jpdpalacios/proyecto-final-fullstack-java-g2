package edu.gestor.mgp.controller;

import edu.gestor.mgp.model.Admin;
import edu.gestor.mgp.model.Cliente;
import edu.gestor.mgp.model.TrabajoARealizar;
import edu.gestor.mgp.repository.AdminRepository;
import edu.gestor.mgp.repository.ClienteRepository;
import edu.gestor.mgp.repository.TrabajoARealizarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/trabajos")
public class TrabajoARealizarController {

    @Autowired
    private TrabajoARealizarRepository trabajoRepository;

    @Autowired
    private ClienteRepository clienteRepository; // Repositorio de clientes

    @Autowired
    private AdminRepository usuarioAdminRepository; // Repositorio de usuarios admin

    @GetMapping("/listar")
    public String listarTrabajos(Model model) {
        List<TrabajoARealizar> trabajos = trabajoRepository.findAll();
        model.addAttribute("trabajos", trabajos);
        return "trabajos";
    }

    @GetMapping("/crear")
    public String mostrarFormularioCreacion(Model model) {
        TrabajoARealizar nuevoTrabajo = new TrabajoARealizar();
        model.addAttribute("nuevoTrabajo", nuevoTrabajo);

        List<Cliente> clientes = clienteRepository.findAll();
        model.addAttribute("clientes", clientes);

        List<Admin> usuariosAdmin = usuarioAdminRepository.findAll();
        model.addAttribute("usuariosAdmin", usuariosAdmin);

        return "crear-trabajo";
    }
    @PostMapping("/crear")
    public String crearTrabajo(@ModelAttribute("nuevoTrabajo") TrabajoARealizar nuevoTrabajo) {
        trabajoRepository.save(nuevoTrabajo);

        return "redirect:/trabajos/listar";
    }
}
