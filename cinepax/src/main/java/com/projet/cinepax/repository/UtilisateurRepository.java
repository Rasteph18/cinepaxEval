package com.projet.cinepax.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.projet.cinepax.models.Utilisateur;

@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Integer> {
    
    @Query(
        value = "SELECT * FROM utilisateur WHERE mail LIKE :mail AND mdp LIKE :mdp",
        nativeQuery = true
    )
    public Utilisateur findByMailAndMdp(String mail, String mdp);
}
