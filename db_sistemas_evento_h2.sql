-- Use o banco de dados H2
DROP SCHEMA IF EXISTS db_sistemas_evento CASCADE;
CREATE SCHEMA IF NOT EXISTS db_sistemas_evento;

-- Tabela tb_categoria
CREATE TABLE IF NOT EXISTS db_sistemas_evento.tb_categoria
(
    id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao_categoria VARCHAR(255) NOT NULL
);

-- Tabela tb_participante
CREATE TABLE IF NOT EXISTS db_sistemas_evento.tb_participante
(
    id                 BIGINT AUTO_INCREMENT PRIMARY KEY,
    email_participante VARCHAR(100) NOT NULL UNIQUE,
    nome_participante  VARCHAR(50)  NOT NULL
);

-- Tabela tb_atividade
CREATE TABLE IF NOT EXISTS db_sistemas_evento.tb_atividade
(
    id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao_atividade VARCHAR(255)   NOT NULL,
    nome_atividade      VARCHAR(60)    NOT NULL,
    preco_atividade     DECIMAL(10, 2) NOT NULL,
    categoria_id        BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES db_sistemas_evento.tb_categoria (id)
);

-- Tabela tb_bloco
CREATE TABLE IF NOT EXISTS db_sistemas_evento.tb_bloco
(
    id                BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao_bloco   VARCHAR(255) NOT NULL,
    data_fim_bloco    TIMESTAMP    NOT NULL,
    data_inicio_bloco TIMESTAMP    NOT NULL,
    atividade_id      BIGINT,
    FOREIGN KEY (atividade_id) REFERENCES db_sistemas_evento.tb_atividade (id)
);

-- Tabela tb_participante_atividade
CREATE TABLE IF NOT EXISTS db_sistemas_evento.tb_participante_atividade
(
    participante_id BIGINT,
    atividade_id    BIGINT,
    PRIMARY KEY (participante_id, atividade_id),
    FOREIGN KEY (participante_id) REFERENCES db_sistemas_evento.tb_participante (id),
    FOREIGN KEY (atividade_id) REFERENCES db_sistemas_evento.tb_atividade (id)
);

-- Inserção de dados
INSERT INTO db_sistemas_evento.tb_categoria (descricao_categoria)
VALUES ('Curso');
INSERT INTO db_sistemas_evento.tb_categoria (descricao_categoria)
VALUES ('Oficina');

INSERT INTO db_sistemas_evento.tb_participante (email_participante, nome_participante)
VALUES ('jose@gmail.com', 'José Silva');
INSERT INTO db_sistemas_evento.tb_participante (email_participante, nome_participante)
VALUES ('Thiago@gmail.com', 'Thiago Faria');
INSERT INTO db_sistemas_evento.tb_participante (email_participante, nome_participante)
VALUES ('maria@gmail.com', 'Maria do Rosário');
INSERT INTO db_sistemas_evento.tb_participante (email_participante, nome_participante)
VALUES ('teresa@gmail.com', 'Teresa Silva');

INSERT INTO db_sistemas_evento.tb_atividade (descricao_atividade, nome_atividade, preco_atividade, categoria_id)
VALUES ('Aprende HTML de forma prática', 'Curso de HTML', 80.00, 1);
INSERT INTO db_sistemas_evento.tb_atividade (descricao_atividade, nome_atividade, preco_atividade, categoria_id)
VALUES ('Controle Versões de seus projetos', 'Oficina de Github', 75.00, 2);

INSERT INTO db_sistemas_evento.tb_bloco (descricao_bloco, data_fim_bloco, data_inicio_bloco, atividade_id)
VALUES ('Bloco 1 Descrição', '2017-09-25 11:00:00', '2017-09-25 08:00:00', 1);
INSERT INTO db_sistemas_evento.tb_bloco (descricao_bloco, data_fim_bloco, data_inicio_bloco, atividade_id)
VALUES ('Bloco 2 Descrição', '2017-09-25 18:00:00', '2017-09-25 14:00:00', 2);
INSERT INTO db_sistemas_evento.tb_bloco (descricao_bloco, data_fim_bloco, data_inicio_bloco, atividade_id)
VALUES ('Bloco 3 Descrição', '2017-09-26 11:00:00', '2017-09-26 08:00:00', 2);

INSERT INTO db_sistemas_evento.tb_participante_atividade (participante_id, atividade_id)
VALUES (1, 1);
INSERT INTO db_sistemas_evento.tb_participante_atividade (participante_id, atividade_id)
VALUES (1, 2);
INSERT INTO db_sistemas_evento.tb_participante_atividade (participante_id, atividade_id)
VALUES (2, 1);
INSERT INTO db_sistemas_evento.tb_participante_atividade (participante_id, atividade_id)
VALUES (3, 1);
INSERT INTO db_sistemas_evento.tb_participante_atividade (participante_id, atividade_id)
VALUES (3, 2);
INSERT INTO db_sistemas_evento.tb_participante_atividade (participante_id, atividade_id)
VALUES (4, 2);

-- Consulta de dados
SELECT *
FROM db_sistemas_evento.tb_categoria;
SELECT *
FROM db_sistemas_evento.tb_participante;
SELECT *
FROM db_sistemas_evento.tb_atividade;
SELECT *
FROM db_sistemas_evento.tb_bloco;
