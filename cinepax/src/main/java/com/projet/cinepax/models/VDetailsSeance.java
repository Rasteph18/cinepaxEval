package com.projet.cinepax.models;

import java.sql.Date;
import java.sql.Time;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "V_details_seance")
public class VDetailsSeance {
    
    @Id
    private int id;
    private String salle;
    private String film;
    private Date dateDiffusion;
    private Time heure;


    public VDetailsSeance()
    {

    }



    public VDetailsSeance(int id, String salle, String film, Date dateDiffusion, Time heure) {
        setId(id);
        setSalle(salle);
        setFilm(film);
        setDateDiffusion(dateDiffusion);
        setHeure(heure);
    }



    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getSalle() {
        return salle;
    }
    public void setSalle(String salle) {
        this.salle = salle;
    }
    public String getFilm() {
        return film;
    }
    public void setFilm(String film) {
        this.film = film;
    }
    public Date getDateDiffusion() {
        return dateDiffusion;
    }
    public void setDateDiffusion(Date dateDiffusion) {
        this.dateDiffusion = dateDiffusion;
    }
    public Time getHeure() {
        return heure;
    }
    public void setHeure(Time heure) {
        this.heure = heure;
    }
}
