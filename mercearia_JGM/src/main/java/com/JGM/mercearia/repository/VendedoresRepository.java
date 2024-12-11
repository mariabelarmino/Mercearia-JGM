package com.JGM.mercearia.repository;

import com.JGM.mercearia.model.Vendedores;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VendedoresRepository extends JpaRepository<Vendedores, Integer> {
}
