package com.JGM.mercearia.repository;

import com.JGM.mercearia.model.Vendas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VendasRepository extends JpaRepository<Vendas, Integer> {
}
