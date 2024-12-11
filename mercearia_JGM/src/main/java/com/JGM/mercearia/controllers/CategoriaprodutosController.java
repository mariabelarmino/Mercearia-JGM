package com.JGM.mercearia.controllers;

import com.JGM.mercearia.model.Categoriaprodutos;
import com.JGM.mercearia.service.CategoriaprodutosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/categoriaProdutos")
public class CategoriaprodutosController {
    
    @Autowired
    private CategoriaprodutosService service;

    @GetMapping
    public List<Categoriaprodutos> getAll() {
        return service.findAll();
    }

    @GetMapping("/<built-in function id>")
    public ResponseEntity<Categoriaprodutos> getById(@PathVariable Integer id) {
        Optional<Categoriaprodutos> entity = service.findById(id);
        return entity.map(ResponseEntity::ok)
                     .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Categoriaprodutos create(@RequestBody Categoriaprodutos entity) {
        return service.save(entity);
    }

    @PutMapping("/<built-in function id>")
    public ResponseEntity<Categoriaprodutos> update(@PathVariable Integer id, @RequestBody Categoriaprodutos entity) {
        if (service.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        entity.setId(Long.valueOf(id));
        return ResponseEntity.ok(service.save(entity));
    }

    @DeleteMapping("/<built-in function id>")
    public ResponseEntity<Void> delete(@PathVariable Integer id) {
        if (service.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        service.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
