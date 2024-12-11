package com.JGM.mercearia.service;

import com.JGM.mercearia.model.Unmedidas;
import com.JGM.mercearia.repository.UnmedidasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UnmedidasService {

    @Autowired
    private UnmedidasRepository repository;

    public List<Unmedidas> findAll() {
        return repository.findAll();
    }

    public Optional<Unmedidas> findById(Integer id) {
        return repository.findById(id);
    }

    public Unmedidas save(Unmedidas entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
