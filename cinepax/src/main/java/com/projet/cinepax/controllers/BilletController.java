package com.projet.cinepax.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.projet.cinepax.models.Utilisateur;
import com.projet.cinepax.security.Role;
import com.projet.cinepax.services.BilletService;
import com.projet.cinepax.services.VDetailsSeanceService;
import com.projet.cinepax.services.VenteService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("billet")
public class BilletController {
    
    @Autowired
    private BilletService billetService;

    @Autowired
    private VDetailsSeanceService vDetailsSeanceService;

    @Autowired
    private VenteService venteService;

    @Role(value = {"ADMIN", "USER"})
    @GetMapping("/page-achat-billet")
    public ModelAndView pageAchatBillet(@RequestParam int idSeance)
    {
        ModelAndView mv = new ModelAndView("pages/achatBillet");

        mv.addObject("listeBillet", billetService.getAllBillet(idSeance));
        mv.addObject("seance", vDetailsSeanceService.getById(idSeance));

        return mv;
    }

    @Role(value = {"ADMIN", "USER"})
    @PostMapping("/achat-billet")
    public ModelAndView achatBillet(@RequestParam int[] idBillet, HttpSession session)
    {
        ModelAndView mv = new ModelAndView("redirect:/seance/liste-seance");

        Utilisateur user = (Utilisateur)session.getAttribute("user");

        venteService.insertDetailsVente(idBillet, user);

        return mv;
    }
}
