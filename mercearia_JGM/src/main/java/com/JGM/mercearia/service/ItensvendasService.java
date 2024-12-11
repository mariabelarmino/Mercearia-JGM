package com.JGM.mercearia.service;

import com.JGM.mercearia.model.Itensvendas;
import com.JGM.mercearia.repository.ItensvendasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ItensvendasService {

    @Autowired
    private ItensvendasRepository repository;

    public List<Itensvendas> findAll() {
        return repository.findAll();
    }

    public Optional<Itensvendas> findById(Integer id) {
        return repository.findById(id);
    }

    public Itensvendas save(Itensvendas entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
