package com.projet.cinepax.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projet.cinepax.models.Utilisateur;
import com.projet.cinepax.repository.UtilisateurRepository;
import com.projet.cinepax.utils.Util;

@Service
public class UtilisateurService {
    
    @Autowired
    private UtilisateurRepository utilisateurRepository;

    public Utilisateur getUserByMailAndMdp(String mail, String mdp)
    {
        Util util = new Util();
        
        Utilisateur user = utilisateurRepository.findByMailAndMdp(mail, util.hashMdp(mdp));
        if (user != null) {
            user.setMdp(null);
        }

        return user;
    }
}
