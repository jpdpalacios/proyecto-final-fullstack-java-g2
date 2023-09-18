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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/trabajos")
public class TrabajoARealizarController {

    @Autowired
    private TrabajoARealizarRepository trabajoRepository;

    @Autowired
    private ClienteRepository clienteRepository;

    @Autowired
    private AdminRepository usuarioAdminRepository;

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

    @GetMapping("/editar/{id}")
    public String mostrarFormularioEdicion(@PathVariable Long id, Model model) {
        TrabajoARealizar trabajo = trabajoRepository.findById(id).orElse(null);

        if (trabajo != null) {
            model.addAttribute("trabajo", trabajo);

            List<Cliente> clientes = clienteRepository.findAll();
            model.addAttribute("clientes", clientes);

            List<Admin> usuariosAdmin = usuarioAdminRepository.findAll();
            model.addAttribute("usuariosAdmin", usuariosAdmin);

            return "editar-trabajo";
        } else {
            return "redirect:/trabajos/listar";
        }
    }

    @PostMapping("/editar/{id}")
    public String actualizarTrabajo(@PathVariable Long id, @ModelAttribute("trabajo") TrabajoARealizar trabajo) {
        trabajo.setId(id);
        trabajoRepository.save(trabajo);

        return "redirect:/trabajos/listar";
    }

    @PostMapping("/eliminar/{id}")
    public String eliminarTrabajo(@PathVariable Long id) {
        TrabajoARealizar trabajo = trabajoRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Trabajo no encontrado con ID: " + id));

        trabajoRepository.delete(trabajo);

        return "redirect:/trabajos/listar";
    }
}
