package com.projet.cinepax.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.projet.cinepax.models.VDetailsSeance;
import com.projet.cinepax.security.Role;
import com.projet.cinepax.services.VDetailsSeanceService;

@Controller
@RequestMapping("seance")
public class SeanceController {
    
    @Autowired
    private VDetailsSeanceService vDetailsSeanceService;

    @Role(value = {"ADMIN", "USER"})
    @GetMapping("/liste-seance")
    public ModelAndView listeSeance(@RequestParam(defaultValue = "0") int numPage)
    {
        ModelAndView mv = new ModelAndView("pages/listesSeance");

        Page<VDetailsSeance> listeSeance = vDetailsSeanceService.getAllSeance(numPage, 5);

        mv.addObject("listeSeance", listeSeance.getContent());
        mv.addObject("nbPage", listeSeance.getTotalPages());

        return mv;
    }
}
