package com.restful.sistemasevento.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "Participante")
@Table(
        name = "tb_participante",
        schema = "db_sistema_evento"
)
public class Participante {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(columnDefinition = "BIGINT UNSIGNED")
    private Long id;

    @Column(name = "nome_participante",
            nullable = false,
            columnDefinition = "VARCHAR(50)")
    private String nome;

    @Email
    @Column(name = "email_participante",
            nullable = false,
            unique = true,
            columnDefinition = "VARCHAR(100)")
    private String email;

    @ManyToMany
    @JoinTable(name = "tb_participante_atividade",
            joinColumns = @JoinColumn(name = "participante_id"),
            inverseJoinColumns = @JoinColumn(name = "atividade_id"))
    @Setter(AccessLevel.NONE)
    private Set<Atividade> atividades = new HashSet<>();
}
