package com.JGM.mercearia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VendasService {

    @Autowired
    private VendasRepository repository;

    public List<Vendas> findAll() {
        return repository.findAll();
    }

    public Optional<Vendas> findById(Integer id) {
        return repository.findById(id);
    }

    public Vendas save(Vendas entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
