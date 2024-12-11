package com.JGM.mercearia.service;

import com.JGM.mercearia.model.Departamentos;
import com.JGM.mercearia.repository.DepartamentosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DepartamentosService {

    @Autowired
    private DepartamentosRepository repository;

    public List<Departamentos> findAll() {
        return repository.findAll();
    }

    public Optional<Departamentos> findById(Integer id) {
        return repository.findById(id);
    }

    public Departamentos save(Departamentos entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
