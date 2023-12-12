DROP DATABASE IF EXISTS db_sistemas_evento;
CREATE DATABASE IF NOT EXISTS db_sistemas_evento;
USE db_sistemas_evento;

CREATE TABLE IF NOT EXISTS tb_categoria
(
    id                  BIGINT UNSIGNED AUTO_INCREMENT,
    descricao_categoria TEXT NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_participante
(
    id                 BIGINT UNSIGNED AUTO_INCREMENT,
    id_atividade       BIGINT UNSIGNED,
    nome_participante  VARCHAR(50)  NOT NULL,
    email_participante VARCHAR(100) NOT NULL UNIQUE,

    PRIMARY KEY (id),

    FOREIGN KEY (id_atividade) REFERENCES tb_atividade (id)
);

CREATE TABLE IF NOT EXISTS tb_bloco
(
    id                BIGINT UNSIGNED AUTO_INCREMENT,
    descricao_bloco   TEXT      NOT NULL,
    data_inicio_bloco TIMESTAMP NOT NULL,
    data_fim_bloco    TIMESTAMP NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_atividade
(
    id                  BIGINT UNSIGNED AUTO_INCREMENT,
    categoria_id        BIGINT UNSIGNED,
    participante_id     BIGINT UNSIGNED,
    blocos_id           BIGINT UNSIGNED,
    nome_atividade      VARCHAR(60)    NOT NULL,
    descricao_atividade TEXT           NOT NULL,
    preco_atividade     DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id),
    FOREIGN KEY (participante_id) REFERENCES tb_participante (id),
    FOREIGN KEY (blocos_id) REFERENCES tb_bloco (id)
);