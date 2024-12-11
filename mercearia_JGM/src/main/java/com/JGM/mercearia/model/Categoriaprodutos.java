package com.JGM.mercearia.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "categoriaProdutos")
public class Categoriaprodutos {

    private Integer idCatProd;
    private String nomeCat;
    @Getter
    @Setter
    @Id
    private Long id;

    // Getters e Setters
}
