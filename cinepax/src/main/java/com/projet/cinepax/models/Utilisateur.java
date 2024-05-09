package com.projet.cinepax.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Utilisateur {
    
    @Id
    @GeneratedValue(
        strategy = GenerationType.IDENTITY
    )
    private int id;
    private String mail;
    private String mdp;
    private int role;


    public Utilisateur() 
    {

    }


    public Utilisateur(int id, String mail, String mdp, int role) {
        setId(id);
        setMail(mail);
        setMdp(mdp);
        setRole(role);
    }

    public String getRoleAuth()
    {
        if (role == 20) {
            return "USER";
        } else if (role == 10) {
            return "ADMIN";
        }
        return "USER";
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public String getMail() {
        return mail;
    }


    public void setMail(String mail) {
        this.mail = mail;
    }


    public String getMdp() {
        return mdp;
    }


    public void setMdp(String mdp) {
        this.mdp = mdp;
    }


    public int getRole() {
        return role;
    }


    public void setRole(int role) {
        this.role = role;
    }

    
    
}
