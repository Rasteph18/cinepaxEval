package com.projet.cinepax.models;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Billet {
    
    @Id
    @GeneratedValue(
        strategy = GenerationType.IDENTITY
    )
    private int id;
    private int idSeance;
    private Date dateJour;
    private double prix;
    private String range;
    private String numero;
    private int etat;

    public Billet()
    {

    }



    public Billet(int id, int idSeance, Date dateJour, double prix, String range, String numero, int etat) {
        setId(id);
        setIdSeance(idSeance);
        setDateJour(dateJour);
        setPrix(prix);
        setRange(range);
        setNumero(numero);
        setEtat(etat);
    }



    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIdSeance() {
        return idSeance;
    }
    public void setIdSeance(int idSeance) {
        this.idSeance = idSeance;
    }
    public Date getDateJour() {
        return dateJour;
    }
    public void setDateJour(Date dateJour) {
        this.dateJour = dateJour;
    }
    public double getPrix() {
        return prix;
    }
    public void setPrix(double prix) {
        this.prix = prix;
    }
    public String getRange() {
        return range;
    }
    public void setRange(String range) {
        this.range = range;
    }
    public String getNumero() {
        return numero;
    }
    public void setNumero(String numero) {
        this.numero = numero;
    }
    public int getEtat() {
        return etat;
    }
    public void setEtat(int etat) {
        this.etat = etat;
    }
}
