package com.restful.sistemasevento.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "Bloco")
@Table(
        name = "tb_bloco",
        schema = "db_sistema_evento"
)
public class Bloco {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    @Column(name = "descricao_bloco",
            nullable = false,
            columnDefinition = "TEXT")
    private String descricao;

    @Column(name = "data_inicio_bloco",
            nullable = false,
            columnDefinition = "TIMESTAMP")
    private Instant inicio;

    @Column(name = "data_fim_bloco",
            nullable = false,
            columnDefinition = "TIMESTAMP")
    private Instant fim;

    @ManyToOne
    @JoinColumn(name = "atividade_id")
    private Atividade atividade;
}