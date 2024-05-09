package com.projet.cinepax.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.projet.cinepax.models.Billet;

@Repository
public interface BilletRepository extends JpaRepository<Billet, Integer> {
    
    @Query(
        value = """
            SELECT b.id, b.id_seance, b.date_jour, b.prix, b.range, b.numero, b.etat FROM billet b
            JOIN seance ON b.id_seance = seance.id
            WHERE seance.id = :idSeance AND b.date_jour >= NOW() ORDER BY b.id, b.date_jour
                """,
        nativeQuery = true
    )
    public List<Billet> findAllBillet(int idSeance);

    @Modifying
    @Query(
        value = "UPDATE billet SET etat = :etat WHERE id = :idBillet",
        nativeQuery = true
    )
    public void updateToEtatVendu(int idBillet, int etat);
}
