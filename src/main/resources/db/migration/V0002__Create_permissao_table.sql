CREATE TABLE permissao (
	id serial primary key not null,
	descricao VARCHAR(50) NOT NULL
)

INSERT INTO permissao (id,descricao) values (1,'ROLE_ADMIN');
INSERT INTO permissao (id,descricao) values (2,'ROLE_COMUM');