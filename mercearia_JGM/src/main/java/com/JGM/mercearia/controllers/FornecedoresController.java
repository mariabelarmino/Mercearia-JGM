package com.JGM.mercearia.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/fornecedores")
public class FornecedoresController {
    
    @Autowired
    private FornecedoresService service;

    @GetMapping
    public List<Fornecedores> getAll() {
        return service.findAll();
    }

    @GetMapping("/<built-in function id>")
    public ResponseEntity<Fornecedores> getById(@PathVariable Integer id) {
        Optional<Fornecedores> entity = service.findById(id);
        return entity.map(ResponseEntity::ok)
                     .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Fornecedores create(@RequestBody Fornecedores entity) {
        return service.save(entity);
    }

    @PutMapping("/<built-in function id>")
    public ResponseEntity<Fornecedores> update(@PathVariable Integer id, @RequestBody Fornecedores entity) {
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
