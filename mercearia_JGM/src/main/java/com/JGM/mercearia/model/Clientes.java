package com.JGM.mercearia.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "clientes")
public class Clientes {

    private Integer idClient;
    private String nomeCliente;
    private String cpf;
    private String tel;
    @Setter
    @Getter
    @Id
    private Long id;


}
