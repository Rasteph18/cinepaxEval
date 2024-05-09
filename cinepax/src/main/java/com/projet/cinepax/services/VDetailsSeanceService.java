package com.projet.cinepax.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.projet.cinepax.models.VDetailsSeance;
import com.projet.cinepax.repository.VDetailsSeanceRepository;

@Service
public class VDetailsSeanceService {
    
    @Autowired
    private VDetailsSeanceRepository vDetailsSeanceRepository;

    public Page<VDetailsSeance> getAllSeance(int numPage, int size)
    {
        Pageable pageable = PageRequest.of(numPage, size);

        return vDetailsSeanceRepository.getAllSeanceAfterToday(pageable);
    }

    public VDetailsSeance getById(int id)
    {
        return vDetailsSeanceRepository.findById(id);
    }
}
