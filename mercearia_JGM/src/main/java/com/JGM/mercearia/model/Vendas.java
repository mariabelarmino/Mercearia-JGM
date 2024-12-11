package com.JGM.mercearia.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "vendas")
public class Vendas {

    private Integer idVenda;
    private Integer idClient;
    private Integer idVendedor;
    private LocalDate dataVenda;
    private BigDecimal valortotal;
    @Getter
    @Setter
    @Id
    private Long id;

}
