package com.projet.cinepax.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.projet.cinepax.models.VDetailsSeance;

@Repository
public interface VDetailsSeanceRepository extends JpaRepository<VDetailsSeance, Integer> {
    
    @Query(
        value = "SELECT * FROM V_details_seance WHERE date_diffusion >= NOW()",
        nativeQuery = true
    )
    public Page<VDetailsSeance> getAllSeanceAfterToday(Pageable pageable);

    public VDetailsSeance findById(int id);

}
