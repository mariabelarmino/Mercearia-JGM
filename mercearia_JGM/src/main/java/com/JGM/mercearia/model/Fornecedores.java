package com.JGM.mercearia.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "fornecedores")
public class Fornecedores {

    private Integer idForn;
    private String nomeForn;
    private String cnpj;
    private String endFornecedor;
    private String telFix;
    private String telCel;
    @Getter
    @Setter
    @Id
    private Long id;

}
