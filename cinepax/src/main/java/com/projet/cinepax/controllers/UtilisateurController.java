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
import com.projet.cinepax.services.UtilisateurService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UtilisateurController {
    
    @Autowired
    private UtilisateurService utilisateurService;

    @GetMapping("/login")
    public ModelAndView login(@RequestParam(required = false) String errorMessage)
    {
        ModelAndView mv = new ModelAndView("pages/login");

        if (errorMessage != null) {
            mv.addObject("errorMessage", errorMessage);
        }

        return mv;
    }


    @PostMapping("/check-login")
    public ModelAndView checkLogin(String mail, String mdp, HttpSession session)
    {
        ModelAndView mv = new ModelAndView("redirect:/seance/liste-seance");

        Utilisateur user = utilisateurService.getUserByMailAndMdp(mail, mdp);
        if (user != null) {
            session.setAttribute("user", user);
        } else {
            mv.addObject("errorMessage", "Vérifier votre mail ou mot de passe");
            mv.setViewName("redirect:/user/login");
            return mv;
        }

        return mv;

    }
}
