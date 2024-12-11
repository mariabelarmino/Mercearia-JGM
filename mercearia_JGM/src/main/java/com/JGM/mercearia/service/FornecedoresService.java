package com.JGM.mercearia.service;

import com.JGM.mercearia.model.Fornecedores;
import com.JGM.mercearia.repository.FornecedoresRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FornecedoresService {

    @Autowired
    private FornecedoresRepository repository;

    public List<Fornecedores> findAll() {
        return repository.findAll();
    }

    public Optional<Fornecedores> findById(Integer id) {
        return repository.findById(id);
    }

    public Fornecedores save(Fornecedores entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
