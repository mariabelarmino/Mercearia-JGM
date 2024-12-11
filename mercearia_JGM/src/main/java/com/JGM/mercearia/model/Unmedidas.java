package com.JGM.mercearia.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "unMedidas")
public class Unmedidas {

    private Integer idUn;
    private String descricao;
    private String abreviatura;
    @Getter
    @Setter
    @Id
    private Long id;

}
