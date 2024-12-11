package com.JGM.mercearia.service;

import com.JGM.mercearia.model.Categoriaprodutos;
import com.JGM.mercearia.repository.CategoriaprodutosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoriaprodutosService {

    @Autowired
    private CategoriaprodutosRepository repository;

    public List<Categoriaprodutos> findAll() {
        return repository.findAll();
    }

    public Optional<Categoriaprodutos> findById(Integer id) {
        return repository.findById(id);
    }

    public Categoriaprodutos save(Categoriaprodutos entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
