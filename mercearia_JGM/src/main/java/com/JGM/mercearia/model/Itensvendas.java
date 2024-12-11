package com.JGM.mercearia.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "itensVendas")
public class Itensvendas {

    private Integer idItVenda;
    private Integer idProd;
    private Integer quantidade;
    private Integer idVenda;
    @Getter
    @Setter
    @Id
    private Long id;

}
