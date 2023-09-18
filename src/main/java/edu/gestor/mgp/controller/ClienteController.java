package edu.gestor.mgp.controller;

import edu.gestor.mgp.model.Cliente;
import edu.gestor.mgp.model.Rol;
import edu.gestor.mgp.model.Usuario;
import edu.gestor.mgp.repository.ClienteRepository;
import edu.gestor.mgp.repository.UsuarioRepository;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/clientes")
public class ClienteController {

    private final ClienteRepository clienteRepository;
    private final UsuarioRepository usuarioRepository;

    public ClienteController(ClienteRepository clienteRepository, UsuarioRepository usuarioRepository) {
        this.clienteRepository = clienteRepository;
        this.usuarioRepository = usuarioRepository;
    }

    @GetMapping("/listar")
    public String listarClientes(Model model) {
        Iterable<Cliente> clientes = clienteRepository.findAll();
        model.addAttribute("clientes", clientes);
        return "lista_clientes";
    }

    @GetMapping("/crear")
    public String mostrarFormularioCreacionCliente(Model model) {
        model.addAttribute("cliente", new Cliente()); // Agrega un objeto Cliente vacío al modelo
        return "crear-cliente";
    }

    @PostMapping("/crear")
    public String crearCliente(@ModelAttribute Cliente cliente, @RequestParam("password") String password) {
        clienteRepository.save(cliente);

        Usuario usuario = new Usuario();
        usuario.setNombre(cliente.getNombre());
        usuario.setContraseña(password);

        usuario.setRol(Rol.usuario_normal);

        usuarioRepository.save(usuario);

        return "redirect:/clientes/listar";
    }

    @GetMapping("/editar/{id}")
    public String mostrarFormularioEdicionCliente(@PathVariable Integer id, Model model) {
        Optional<Cliente> optionalCliente = clienteRepository.findById(id);
        if (optionalCliente.isPresent()) {
            Cliente cliente = optionalCliente.get();
            model.addAttribute("cliente", cliente);
            return "editar-cliente";
        } else {
            // Manejar el caso en que no se encuentra el cliente
            return "redirect:/clientes/listar"; // O redirige a una página de error
        }
    }

    @PostMapping("/editar/{id}")
    public String editarCliente(@PathVariable Integer id, @ModelAttribute Cliente cliente) {
        Optional<Cliente> optionalCliente = clienteRepository.findById(id);
        if (optionalCliente.isPresent()) {
            Cliente clienteExistente = optionalCliente.get();
            clienteExistente.setNombre(cliente.getNombre());
            clienteExistente.setApellido(cliente.getApellido());
            clienteExistente.setEmail(cliente.getEmail());
            clienteRepository.save(clienteExistente);
        }
        return "redirect:/clientes/listar";
    }

    
}
