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
INSERT INTO tb_participante_atividade (participante_id, atividade_id)VALUES (4, 2); 

SELECT * FROM tb_categoria;
SELECT * FROM tb_participante;
SELECT * FROM tb_atividade;
SELECT * FROM tb_bloco;