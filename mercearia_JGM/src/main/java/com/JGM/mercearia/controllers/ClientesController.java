package com.JGM.mercearia.controllers;

import com.JGM.mercearia.model.Clientes;
import com.JGM.mercearia.service.ClientesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/clientes")
public class ClientesController {
    
    @Autowired
    private ClientesService service;

    @GetMapping
    public List<Clientes> getAll() {
        return service.findAll();
    }

    @GetMapping("/<built-in function id>")
    public ResponseEntity<Clientes> getById(@PathVariable Integer id) {
        Optional<Clientes> entity = service.findById(id);
        return entity.map(ResponseEntity::ok)
                     .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Clientes create(@RequestBody Clientes entity) {
        return service.save(entity);
    }

    @PutMapping("/<built-in function id>")
    public ResponseEntity<Clientes> update(@PathVariable Integer id, @RequestBody Clientes entity) {
        if (!service.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        entity.setId(id);
        return ResponseEntity.ok(service.save(entity));
    }

    @DeleteMapping("/<built-in function id>")
    public ResponseEntity<Void> delete(@PathVariable Integer id) {
        if (!service.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        service.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
