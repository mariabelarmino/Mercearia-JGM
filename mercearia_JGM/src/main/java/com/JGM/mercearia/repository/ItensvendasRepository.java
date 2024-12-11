package com.JGM.mercearia.repository;

import com.JGM.mercearia.model.Itensvendas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItensvendasRepository extends JpaRepository<Itensvendas, Integer> {
}
