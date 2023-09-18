package edu.gestor.mgp.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import edu.gestor.mgp.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    List<Usuario> findByRol(String rol);

    @Query("SELECT u FROM Usuario u WHERE u.rol = :rol")
    List<Usuario> findUsuariosByRol(@Param("rol") String rol);
}
