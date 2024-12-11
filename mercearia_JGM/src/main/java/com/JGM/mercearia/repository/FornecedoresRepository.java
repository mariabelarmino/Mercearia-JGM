package com.JGM.mercearia.repository;

import com.JGM.mercearia.model.Fornecedores;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FornecedoresRepository extends JpaRepository<Fornecedores, Integer> {
}
