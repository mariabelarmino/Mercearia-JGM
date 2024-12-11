package com.JGM.mercearia.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "vendedores")
public class Vendedores {

    private Integer idVendedor;
    private String nomeVendedor;
    private Integer idDepartamento;
    @Getter
    @Setter
    @Id
    private Long id;

}
