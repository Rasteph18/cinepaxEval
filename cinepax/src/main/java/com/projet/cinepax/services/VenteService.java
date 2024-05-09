package com.projet.cinepax.services;

import java.sql.Date;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.projet.cinepax.models.Utilisateur;
import com.projet.cinepax.models.Vente;
import com.projet.cinepax.repository.VenteRepository;

@Service
public class VenteService {
    
    @Autowired
    private VenteRepository venteRepository;

    @Autowired
    private BilletService billetService;
    
    @Transactional
    public void insertVente(int idBillet, Utilisateur user)
    {
        Vente vente = new Vente();
        Date now = Date.valueOf(LocalDate.now());

        vente.setDateVente(now);
        vente.setIdBillet(idBillet);
        vente.setIdUtilisateur(user.getId());

        venteRepository.save(vente);
    }

    @Transactional
    public void insertDetailsVente(int[] idBillet, Utilisateur utilisateur)
    {
        for (int i = 0; i < idBillet.length; i++) {
            billetService.updateToEtatVendu(idBillet[i], 10);
            insertVente(idBillet[i], utilisateur);
        }
    }
}
