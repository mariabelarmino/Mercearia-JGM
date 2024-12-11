package com.JGM.mercearia.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/itensVendas")
public class ItensvendasController {
    
    @Autowired
    private ItensvendasService service;

    @GetMapping
    public List<Itensvendas> getAll() {
        return service.findAll();
    }

    @GetMapping("/<built-in function id>")
    public ResponseEntity<Itensvendas> getById(@PathVariable Integer id) {
        Optional<Itensvendas> entity = service.findById(id);
        return entity.map(ResponseEntity::ok)
                     .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Itensvendas create(@RequestBody Itensvendas entity) {
        return service.save(entity);
    }

    @PutMapping("/<built-in function id>")
    public ResponseEntity<Itensvendas> update(@PathVariable Integer id, @RequestBody Itensvendas entity) {
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
