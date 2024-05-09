package com.projet.cinepax.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.projet.cinepax.models.Billet;
import com.projet.cinepax.repository.BilletRepository;

@Service
public class BilletService {
 
    @Autowired
    private BilletRepository billetRepository;

    public List<Billet> getAllBillet(int idSeance)
    {
        return billetRepository.findAllBillet(idSeance);
    }

    @Transactional
    public void updateToEtatVendu(int idBillet, int etat)
    {
        billetRepository.updateToEtatVendu(idBillet, etat);
    }
}
