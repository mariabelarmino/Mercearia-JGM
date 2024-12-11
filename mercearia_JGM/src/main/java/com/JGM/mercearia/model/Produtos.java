package com.JGM.mercearia.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "produtos")
public class Produtos {

    private Integer idProd;
    private String nomeProd;
    private Integer idUn;
    private Integer idCatProd;
    private Integer idForn;
    private BigDecimal precoProd;
    @Getter
    @Setter
    @Id
    private Long id;

}
