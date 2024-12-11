package com.JGM.mercearia.repository;

import com.JGM.mercearia.model.Unmedidas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UnmedidasRepository extends JpaRepository<Unmedidas, Integer> {
}
