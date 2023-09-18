package edu.gestor.mgp.repository;

import edu.gestor.mgp.model.TrabajoARealizar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TrabajoARealizarRepository extends JpaRepository<TrabajoARealizar, Long> {
}
