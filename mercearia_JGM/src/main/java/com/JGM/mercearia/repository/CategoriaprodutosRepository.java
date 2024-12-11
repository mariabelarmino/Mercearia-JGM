package com.JGM.mercearia.repository;

import com.JGM.mercearia.model.Categoriaprodutos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriaprodutosRepository extends JpaRepository<Categoriaprodutos, Integer> {
}
