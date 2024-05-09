package com.projet.cinepax.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.projet.cinepax.models.Vente;

@Repository
public interface VenteRepository extends JpaRepository<Vente, Integer> {
    
}
