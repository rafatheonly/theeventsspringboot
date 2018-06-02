INSERT INTO usuario (id, nome, cpf, email, senha, foto, ativo) 
VALUES (NULL, 'Rafael Calearo', '012.521.110-45', 'rafaelcalearo@gmail.com', '12345', '-', '0');
INSERT INTO usuario (id, nome, cpf, email, senha, foto, ativo) 
VALUES (NULL, 'Michel Luz', '014.543.234-99', 'michelluz@gmail.com', '54321', '-', '0');

INSERT INTO tipoevento (id, descricao) 
VALUES (NULL, 'Churrasco'), (NULL, 'Aniversário'), (NULL, 'Casamento'), (NULL, 'Balada');

INSERT INTO evento (id, titulo, data, descricao, local, foto, ativo, tipoevento_id) 
VALUES (NULL, 'Encontro da Gatas', '2018-09-10', 'Festa com muita bebida e mulheres.', 'Fenadoce', '-', '0', 2), 
       (NULL, 'Futebol Solidario', '2018-10-11', 'Todos juntos para assistir a nossa Seleção.', 'R. Manuel Caetano da Silva, n° 156', '-', '0', 1);

INSERT INTO usuarioevento (id, usuario_id, evento_id, dataCriacao) VALUES (NULL, 2, 1, '2018-06-01');

INSERT INTO comentario (id, usuario_id, evento_id, dataComentario, comentario, ativo) VALUES (NULL, 1, 1, '2018-06-02', 'Otima festa!', '0');