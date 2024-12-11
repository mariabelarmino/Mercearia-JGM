package com.JGM.mercearia.service;

import com.JGM.mercearia.model.Clientes;
import com.JGM.mercearia.repository.ClientesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ClientesService {

    private final ClientesRepository repository;

    public ClientesService(ClientesRepository repository) {
        this.repository = repository;
    }

    public List<Clientes> findAll() {
        return repository.findAll();
    }

    public Optional<Clientes> findById(Integer id) {
        return repository.findById(id);
    }

    public Clientes save(Clientes entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
