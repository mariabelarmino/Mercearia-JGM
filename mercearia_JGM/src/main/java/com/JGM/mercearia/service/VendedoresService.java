package com.JGM.mercearia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VendedoresService {

    @Autowired
    private VendedoresRepository repository;

    public List<Vendedores> findAll() {
        return repository.findAll();
    }

    public Optional<Vendedores> findById(Integer id) {
        return repository.findById(id);
    }

    public Vendedores save(Vendedores entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
