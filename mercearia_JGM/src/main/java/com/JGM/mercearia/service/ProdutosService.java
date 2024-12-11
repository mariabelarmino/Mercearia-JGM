package com.JGM.mercearia.service;

import com.JGM.mercearia.model.Produtos;
import com.JGM.mercearia.repository.ProdutosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProdutosService {

    @Autowired
    private ProdutosRepository repository;

    public List<Produtos> findAll() {
        return repository.findAll();
    }

    public Optional<Produtos> findById(Integer id) {
        return repository.findById(id);
    }

    public Produtos save(Produtos entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
