package com.example.ressourceRelationnelle.DataAccess;

import com.example.ressourceRelationnelle.Modele.Ressource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

public interface RessourceRepository extends JpaRepository<Ressource, Long> {
    public List<Ressource> findAll();
    public Optional<Ressource> findById(Long id);

    //-- lister les ressources selon un type de relation
    @Query("SELECT r FROM Ressource r JOIN r.type_relation tr WHERE tr.id = :typeRelationId")
    public List<Ressource> findByTypeRelationId(@Param("typeRelationId") Long typeRelationId);

}
