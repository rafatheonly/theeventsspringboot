CREATE TABLE USUARIO(
	ID serial primary key not null ,
	nome VARCHAR(100) not null,
	cpf VARCHAR(30) not null,
	email VARCHAR(70) not null,
	senha VARCHAR(150) NOT NULL,
	foto VARCHAR(50),
	ativo BOOLEAN not null
);

CREATE TABLE usuario_permissao (
	id_usuario serial NOT NULL,
	id_permissao serial NOT NULL,
	PRIMARY KEY (id_usuario, id_permissao),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (id_permissao) REFERENCES permissao(id)
)

INSERT INTO USUARIO (id, nome, cpf, email, senha, ativo) values (1, 'administrador', 
	'123.456.789', 'teste@gmail.com', '123', TRUE);
	
INSERT INTO USUARIO (id, nome, cpf, email, senha, ativo) values (2, 'comum', 
	'987.654.321', 'comum@gmail.com', '123', TRUE);
	
INSERT INTO usuario_permissao (id_usuario, id_permissao) values (1, 1);
INSERT INTO usuario_permissao (id_usuario, id_permissao) values (2, 2);