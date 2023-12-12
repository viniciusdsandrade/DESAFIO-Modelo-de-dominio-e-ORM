package com.restful.sistemasevento.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "Atividade")
@Table(
        name = "tb_atividade",
        schema = "db_sistema_evento"
)
public class Atividade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    @Column(name = "nome_atividade",
            nullable = false,
            columnDefinition = "VARCHAR(60)")
    private String nome;

    @Column(name = "descricao_atividade",
            nullable = false,
            columnDefinition = "TEXT")
    private String descricao;

    @Column(name = "preco_atividade",
            nullable = false,
            columnDefinition = "DECIMAL(10,2)")
    private Double preco;

    @ManyToMany(mappedBy = "atividades")
    private Set<Participante> participantes = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "atividade_id")
    private List<Bloco> blocos = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "categoria_id")
    private Categoria categorias;
}
