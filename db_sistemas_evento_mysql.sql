DROP DATABASE IF EXISTS db_sistemas_evento;
CREATE DATABASE IF NOT EXISTS db_sistemas_evento;
USE db_sistemas_evento;

CREATE TABLE IF NOT EXISTS tb_categoria
(
    id                  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    descricao_categoria TEXT            NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tb_participante
(
    id                 BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    email_participante VARCHAR(100)    NOT NULL UNIQUE,
    nome_participante  VARCHAR(50)     NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tb_atividade
(
    id                  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    descricao_atividade TEXT            NOT NULL,
    nome_atividade      VARCHAR(60)     NOT NULL,
    preco_atividade     DECIMAL(10, 2)  NOT NULL,
    categoria_id        BIGINT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tb_participante_atividade
(
    participante_id BIGINT UNSIGNED NOT NULL,
    atividade_id    BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (participante_id, atividade_id),
    FOREIGN KEY (atividade_id) REFERENCES tb_atividade (id),
    FOREIGN KEY (participante_id) REFERENCES tb_participante (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tb_bloco
(
    id                BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    descricao_bloco   TEXT            NOT NULL,
    data_fim_bloco    TIMESTAMP       NOT NULL,
    data_inicio_bloco TIMESTAMP       NOT NULL,
    atividade_id      BIGINT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (atividade_id) REFERENCES tb_atividade (id)
) ENGINE = InnoDB;

-- Inserindo dados na tabela tb_categoria
INSERT INTO tb_categoria (descricao_categoria) VALUES ('Curso');
INSERT INTO tb_categoria (descricao_categoria) VALUES ('Oficina');

INSERT INTO tb_participante (email_participante, nome_participante) VALUES ('jose@gmail.com', 'José Silva');
INSERT INTO tb_participante (email_participante, nome_participante) VALUES ('Thiago@gmail.com', 'Thiago Faria');
INSERT INTO tb_participante (email_participante, nome_participante) VALUES ('maria@gmail.com', 'Maria do Rosário');
INSERT INTO tb_participante (email_participante, nome_participante) VALUES ('teresa@gmail.com', 'Teresa Silva');

INSERT INTO tb_atividade (descricao_atividade, nome_atividade, preco_atividade, categoria_id) VALUES ('Aprende HTML de forma prática', 'Curso de HTML', 80.00, 1);
INSERT INTO tb_atividade (descricao_atividade, nome_atividade, preco_atividade, categoria_id) VALUES ('Controle Versões de seus projetos', 'Oficina de Github', 75.00, 2);

INSERT INTO tb_bloco (descricao_bloco, data_fim_bloco, data_inicio_bloco, atividade_id) VALUES ('Bloco 1 Descrição', '2017-09-25 11:00:00', '2017-09-25 08:00:00', 1);
INSERT INTO tb_bloco (descricao_bloco, data_fim_bloco, data_inicio_bloco, atividade_id) VALUES ('Bloco 2 Descrição', '2017-09-25 18:00:00', '2017-09-25 14:00:00', 2);
INSERT INTO tb_bloco (descricao_bloco, data_fim_bloco, data_inicio_bloco, atividade_id) VALUES ('Bloco 3 Descrição', '2017-09-26 11:00:00', '2017-09-26 08:00:00', 2);

INSERT INTO tb_participante_atividade (participante_id, atividade_id) VALUES (1, 1);
INSERT INTO tb_participante_atividade (participante_id, atividade_id) VALUES (1, 2);
INSERT INTO tb_participante_atividade (participante_id, atividade_id) VALUES (2, 1);
INSERT INTO tb_participante_atividade (participante_id, atividade_id) VALUES (3, 1);
INSERT INTO tb_participante_atividade (participante_id, atividade_id) VALUES (3, 2);
INSERT INTO tb_participante_atividade (participante_id, atividade_id) VALUES (4, 2);

SELECT * FROM tb_categoria;
SELECT * FROM tb_participante;
SELECT * FROM tb_atividade;
SELECT * FROM tb_bloco;