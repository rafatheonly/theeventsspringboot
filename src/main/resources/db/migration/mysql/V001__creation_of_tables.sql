CREATE TABLE IF NOT EXISTS usuario (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  email VARCHAR(50) NOT NULL,
  senha VARCHAR(32) NOT NULL,
  foto VARCHAR(60) NULL,
  ativo BIT NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS tipoevento (
  id BIGINT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS evento (
  id BIGINT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(45) NOT NULL,
  data VARCHAR(11) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  local VARCHAR(45) NOT NULL,
  foto VARCHAR(60) NULL,
  ativo BIT NOT NULL,
  tipoevento_id BIGINT NOT NULL,
  PRIMARY KEY (id),  
    FOREIGN KEY (tipoevento_id) REFERENCES tipoevento (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS usuarioevento (
  id BIGINT NOT NULL AUTO_INCREMENT,
  usuario_id BIGINT NOT NULL,
  evento_id BIGINT NOT NULL,
  dataCriacao DATE NOT NULL,
  PRIMARY KEY (id), 
    FOREIGN KEY (usuario_id) REFERENCES usuario (id),   
    FOREIGN KEY (evento_id) REFERENCES evento (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS comentario (
  id BIGINT NOT NULL AUTO_INCREMENT,
  usuario_id BIGINT NOT NULL,
  evento_id BIGINT NOT NULL,
  dataComentario DATE NOT NULL,
  comentario VARCHAR(255) NOT NULL,
  ativo BIT NOT NULL,
  PRIMARY KEY (id), 
    FOREIGN KEY (usuario_id) REFERENCES usuario (id),
    FOREIGN KEY (evento_id) REFERENCES evento (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;